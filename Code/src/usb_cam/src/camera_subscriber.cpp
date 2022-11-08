#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <opencv2/highgui/highgui.hpp>
#include <cv_bridge/cv_bridge.h>
#include <opencv2/opencv.hpp>
#include <memory>
#include <std_msgs/Int64.h>

#include "usb_cam/MotorMsg.h"
#include "gb_dialog/ActionMsg.h"


#include "/usr/local/include/opencv4/opencv2/objdetect.hpp"
#include "/usr/local/include/opencv4/opencv2/highgui.hpp"
#include "/usr/local/include/opencv4/opencv2/imgproc.hpp"
#include <iostream>




#include "opencv2/core/core.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/highgui/highgui.hpp"

#include <iostream>
#include <math.h>
#include <string.h>

#include <gb_dialog/DialogInterface.h>



#define FOLLOW_PERSON    1
#define FOLLOW_CUBE    2
#define TALK_MODE    3

char follow[] = "follow", talk[] = "talk", deny[] = "deny",nod[] = "nod";

using namespace std;
using namespace cv;
namespace ph = std::placeholders;

int64 face_image_processing(const cv::Mat in_image);
int64 color_image_processing(const cv::Mat in_image);

// For face detection
CascadeClassifier faceCascade; 
String faceCascadePath;
string cascadeName, nestedCascadeName;
Mat frame, image;
Scalar color = Scalar(255, 0, 0);

// To change the mode between follow person and follow cube, 
int image_mode = 3;
String ball_color = "green";

// Sector publisher
//ros::Publisher motor_msg_pub;
ros::Publisher motor_msg_pub;
ros::Subscriber action_sub;

int64 face_image_processing(const cv::Mat in_image);
int64 ball_image_processing(const cv::Mat in_image);



void imageCallback(const sensor_msgs::ImageConstPtr& msg){
  try{
    // Convert ROS Image to CV Image
    cv_bridge::CvImagePtr cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
    cv::Mat image_raw =  cv_ptr->image;

    // Image processing and showing
    if(image_mode==FOLLOW_PERSON)
      int64 sector = face_image_processing(image_raw);
    else if(image_mode== FOLLOW_CUBE )
      int64 sector = ball_image_processing(image_raw);
      
  }
  catch (cv_bridge::Exception& e){
    ROS_ERROR("Could not convert from '%s' to 'bgr8'.", msg->encoding.c_str());
  }
}

// Subscribes to the /action topic 
void actionCallback(const gb_dialog::ActionMsg::ConstPtr& msg) {

  image_mode = msg->mode;
  // Comparing strings to know what to do, if it is follow, set the data.
  // If it is a motor action, send it to the motor controller.
  if(strcmp(follow, msg->action.c_str())== 0){
    // If the data is empty, the last one saved is used
    if(strlen(msg->data.c_str())>1)
      ball_color = msg->data;
    ROS_INFO("El modo es %s, color es %s", follow, ball_color.c_str());
  }else{
    ROS_INFO("El modo es %s", msg->action.c_str());
    usb_cam::MotorMsg msg2;
    msg2.motor_action =  msg->action.c_str();
    motor_msg_pub.publish(msg2);
  }
}

int main(int argc, char **argv){

  //For face detection
  faceCascadePath = "/home/alberto/catkin_ws/src/usb_cam/cascade/haarcascade_frontalface_default.xml";
  // faceCascadePath = "/home/alberto/catkin_ws/src/usb_cam/cascade/haarcascade_frontalface_default.xml";
  faceCascade.load( faceCascadePath );
  // Show image
    cv::startWindowThread();

  ros::init(argc, argv, "image_listener_node");
  ros::NodeHandle nh;
  
  image_transport::ImageTransport it(nh);
  image_transport::Subscriber image_sub = it.subscribe("/usb_cam/image_raw", 1, imageCallback);

  // motor_msg_pub = nh.advertise<std_msgs::Int64>("sector", 1000);

  motor_msg_pub = nh.advertise<usb_cam::MotorMsg>("motor_msg", 1000);

  action_sub = nh.subscribe("action", 1000, actionCallback);

  ros::Rate loop_rate(10);
  while (ros::ok()) {
    ros::spinOnce();
    loop_rate.sleep();
  }
  cv::destroyWindow("out_image");
}

int64 face_image_processing(const cv::Mat in_image){
  // Create output image
  cv::Mat out_image = in_image.clone();
  // Detect faces
  Mat frameGray;
  std::vector<Rect> faces;
  cvtColor( out_image, frameGray, COLOR_BGR2GRAY );
   Size minSize;
  minSize.height = 30;
  minSize.width = 20;
  faceCascade.detectMultiScale(frameGray, faces,1.5,8,0,minSize);
  

  Point center;
  int64 x_sector = -100;
  int64 y_sector = -100;
  int x2 = -1;
  int y2 = -1;

  int biggest_face;
  double maxArea = 0.0;
  // Selects only the biggest face to avoid errors in lighting
  for (int i = 0; i< faces.size(); i++){
    Point a;
    a.x = faces[i].x;
    a.y =faces[i].y;
    Point b;
    b.x = faces[i].x+faces[i].width;
    b.y = faces[i].y +faces[i].height;
    cv::rectangle(out_image,a , b, cv::Scalar(0, 255, 0));

    int area = faces[i].area() ;
    if (area > maxArea){
      maxArea = area;
      biggest_face = i;
    }
  }

  //Get the center of the face  and detect the sector, only if it has detectted a face
  if(faces.size() > 0){
    x2 = faces[biggest_face].x + faces[biggest_face].width/2;
    y2 = faces[biggest_face].y + faces[biggest_face].height/2;
    center.x = x2;
    center.y = y2;
      
    if((0<x2)&&(x2<out_image.cols/3)){
      x_sector = 1;
    }else if((out_image.cols/3<x2)&&(x2<2*out_image.cols/3)){
      x_sector = 2;
    }else{
      x_sector = 3;
    }
    if((0<y2)&&(y2<out_image.rows/3)){
      y_sector = 1;
    }else if((out_image.rows/3<y2)&&(y2<2*out_image.rows/3)){
      y_sector = 2;
    }else{
      y_sector = 3;
    }
  // motor_msg_pub.publish(msg);
    usb_cam::MotorMsg msg;
    msg.x_sector = x_sector;
    msg.y_sector = y_sector;

    msg.x=x2;
    msg.y=y2;
    msg.motor_action = "follow";

    motor_msg_pub.publish(msg);
  }
  // Show image in a different window
    //cv::imshow("out",out_image);
      //cv::waitKey(3);
  return 1;
}


// Ball image procesing



// Limits to detect the colors
cv::Scalar yellowLow = cv::Scalar(20, 100, 100);
cv::Scalar yellowHigh = cv::Scalar(30, 255, 255);

cv::Scalar redLow = cv::Scalar(120, 130, 60);
cv::Scalar redHigh = cv::Scalar(180, 255, 255);

cv::Scalar blueLow = cv::Scalar(90, 90, 70);
cv::Scalar blueHigh = cv::Scalar(128, 255, 255);

cv::Scalar greenLow = cv::Scalar(40, 40, 40);
cv::Scalar greenHigh = cv::Scalar(70, 255, 255);

  int detected = 0;
  int timer = 0;

int64 ball_image_processing(const cv::Mat in_image){
  // Create output image
  cv::Mat out_image = in_image.clone();
  // Detect faces
  Mat frameGray;
  std::vector<Rect> faces;

  cv::Scalar ScalarLow = blueLow;
  cv::Scalar ScalarHigh = blueHigh;

  // Select the color of the cube to follow
  if(strcmp("yellow", ball_color.c_str())== 0){
    ScalarLow = yellowLow;
    ScalarHigh = yellowHigh;
  }else if(strcmp("blue", ball_color.c_str())== 0){
    ScalarLow = blueLow;
    ScalarHigh = blueHigh;
  } else if(strcmp("green", ball_color.c_str())== 0){
    ScalarLow = greenLow;
    ScalarHigh = greenHigh;
  }else if(strcmp("red", ball_color.c_str())== 0){
    ScalarLow = redLow;
    ScalarHigh = redHigh;
  }else{return 0;}

  Mat frame, frame_HSV, frame_threshold,threshold_copy ;
  // Convert from BGR to HSV colorspace
  cvtColor(in_image, frame_HSV, COLOR_BGR2HSV);
  // Detect the object based on HSV Range Values
  inRange(frame_HSV, ScalarLow, ScalarHigh, frame_threshold);
  threshold_copy = frame_threshold.clone();
  uchar zero = 0;
// Creates a new image wit the selected colour objets and their surroundings to use in circle detection.
  for( int i = 0; i< frame_threshold.rows; i++){
    for( int j = 0; j< frame_threshold.cols ; j++){
      if(frame_threshold.at<uchar>(i,j) != zero){
       rectangle(threshold_copy, Point(j-3,i-3),Point(j+3,i+3), Scalar(255, 255, 255), FILLED);
      }
    }
  }
  //imshow("threshold", threshold_copy);

  vector<Vec3f> circles;
  Mat gray;
  Mat circles_src = in_image.clone();
  cvtColor(circles_src, gray, COLOR_BGR2GRAY);
  medianBlur(gray, gray, 3);

  Mat outputMat;
  gray.copyTo(outputMat, threshold_copy);
  //imshow("out", outputMat);

  HoughCircles(outputMat, circles, HOUGH_GRADIENT, 1, gray.rows/16, 200, 20, 15, 50 );  // runs the actual detection

  int64 x_sector = -100;
  int64 y_sector = -100;
  int x2 = -1;
  int y2 = -1;


  if (circles.size() > 0 ){
    detected = 0;
    timer = 0;
    
    Vec3i c = circles[0];
    Point center = Point(c[0], c[1]);
    x2 = c[0];
    y2 = c[1];
    circle( out_image, center, 1, Scalar(0,100,100), 3, LINE_AA);
    // circle outline
    int radius = c[2];
    circle( out_image, center, radius, Scalar(0,0,0), 3, LINE_AA);

    if((0<x2)&&(x2<out_image.cols/3)){
      x_sector = 1;
    }else if((out_image.cols/3<x2)&&(x2<2*out_image.cols/3)){
      x_sector = 2;
    }else{
      x_sector = 3;
    }
    if((0<y2)&&(y2<out_image.rows/3)){
      y_sector = 1;
    }else if((out_image.rows/3<y2)&&(y2<2*out_image.rows/3)){
      y_sector = 2;
    }else{
      y_sector = 3;
    }

    // motor_msg_pub.publish(msg);
    usb_cam::MotorMsg msg;
    msg.x_sector = x_sector;
    msg.y_sector = y_sector;

    msg.x=x2;
    msg.y=y2;
    msg.motor_action = "follow";

    motor_msg_pub.publish(msg);

  }else{
    timer++;

    ROS_INFO("Detected vale %d timer vale %d", detected, timer);
    usb_cam::MotorMsg msg2;
    if( timer > 20){

    
    if(detected == 0){
      detected = 1;      
      msg2.motor_action =  "go_left";
      motor_msg_pub.publish(msg2);
      timer =  0;
    }else if((detected == 1)||( detected == 2)){
      detected ++;
      msg2.motor_action =  "go_right";
      motor_msg_pub.publish(msg2);
      timer =  0;
    }else{
      msg2.motor_action =  "off";
      motor_msg_pub.publish(msg2);
      image_mode = TALK_MODE;
      timer =  0;
    }
    }
    
  }
      //cv::imshow("out",out_image);
      //cv::waitKey(3);
  return 1;
}

