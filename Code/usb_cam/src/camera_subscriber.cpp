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
String cube_color = "green";

// Sector publisher
//ros::Publisher motor_msg_pub;
ros::Publisher motor_msg_pub;
ros::Subscriber action_sub;

int64 face_image_processing(const cv::Mat in_image);
int64 cube_image_processing(const cv::Mat in_image);



void imageCallback(const sensor_msgs::ImageConstPtr& msg){
  try{
    // Convert ROS Image to CV Image
    cv_bridge::CvImagePtr cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
    cv::Mat image_raw =  cv_ptr->image;

    // Image processing and showing
    if(image_mode==FOLLOW_PERSON)
      int64 sector = face_image_processing(image_raw);
    else if(image_mode== FOLLOW_CUBE )
      int64 sector = cube_image_processing(image_raw);
      
  }
  catch (cv_bridge::Exception& e){
    ROS_ERROR("Could not convert from '%s' to 'bgr8'.", msg->encoding.c_str());
  }
}

// Subscribes to the /action topic 
void actionCallback(const gb_dialog::ActionMsg::ConstPtr& msg) {

  image_mode = msg->mode;
  // Comparing strings to know what to do
  if(strcmp(follow, msg->action.c_str())== 0){
    // If the data is empty, the last one saved is used
    if(strlen(msg->data.c_str())>1)
      cube_color = msg->data;
    
    ROS_INFO("El modo es     [%s] color es %s", follow, cube_color.c_str());
  }else{
    ROS_INFO("El modo es     [%s]", msg->action.c_str());
    usb_cam::MotorMsg msg2;
    msg2.motor_action =  msg->action.c_str();
    motor_msg_pub.publish(msg2);

  }
}

int main(int argc, char **argv){

  //For face detection
  faceCascadePath = "/home/alberto/catkin_ws/src/usb_cam/cascade/haarcascade_frontalface_default.xml";
  faceCascade.load( faceCascadePath );
  // Show image
      cv::namedWindow("out_image");
  cv::startWindowThread();

  ros::init(argc, argv, "image_listener");
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
  minSize.width = 30;
  faceCascade.detectMultiScale(frameGray, faces,1.2,3,0,minSize);

  Point center;
  int64 x_sector = -100;
  int64 y_sector = -100;
  int x2 = -1;
  int y2 = -1;

  int biggest_face;
  double maxArea = 0.0;
  // Selects only the biggest face to avoid error in lighting
  for (int i = 0; i< faces.size(); i++){
    int area = faces[i].height;
    if (area > maxArea){
      maxArea = area;
      biggest_face = i;
    }
  }

  //Get the centerof the face  and detect the sector, only if it has detectted a face
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
    circle( out_image, center, 5, color, 3, 8, 0 );

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
      cv::imshow("out_image",out_image);
      cv::waitKey(3);
  return 1;
}


// Cube image procesing


const String window_detection_name = "Object Detection";

// Limits to detect the colors
cv::Scalar yellowLow = cv::Scalar(20, 100, 100);
cv::Scalar yellowHigh = cv::Scalar(30, 255, 255);

cv::Scalar redLow = cv::Scalar(120, 160, 90);
cv::Scalar redHigh = cv::Scalar(180, 255, 255);

cv::Scalar blueLow = cv::Scalar(90, 90, 70);
cv::Scalar blueHigh = cv::Scalar(128, 255, 255);

cv::Scalar greenLow = cv::Scalar(40, 40, 40);
cv::Scalar greenHigh = cv::Scalar(70, 255, 255);



int64 cube_image_processing(const cv::Mat in_image){
  // Create output image
  cv::Mat out_image = in_image.clone();
  // Detect faces
  Mat frameGray;
  std::vector<Rect> faces;

  namedWindow(window_detection_name);
  cv::Scalar ScalarLow = blueLow;
  cv::Scalar ScalarHigh = blueHigh;


  // Select the color of the cube to follow
  if(strcmp("yellow", cube_color.c_str())== 0){
    ScalarLow = yellowLow;
    ScalarHigh = yellowHigh;
  }else if(strcmp("blue", cube_color.c_str())== 0){
    ScalarLow = blueLow;
    ScalarHigh = blueHigh;
  } else if(strcmp("green", cube_color.c_str())== 0){
    ScalarLow = greenLow;
    ScalarHigh = greenHigh;
  }else{return 0;}


  Mat frame, frame_HSV, frame_threshold;
  // Convert from BGR to HSV colorspace
  cvtColor(in_image, frame_HSV, COLOR_BGR2HSV);
  // Detect the object based on HSV Range Values
  inRange(frame_HSV, ScalarLow, ScalarHigh, frame_threshold);
  // Show the frames
  imshow(window_detection_name, frame_threshold);

  // detect the contours on the binary image using cv2.CHAIN_APPROX_NONE
	vector<vector<Point>> contours;

	vector<Vec4i> hierarchy;

	findContours(frame_threshold, contours, hierarchy, CV_RETR_EXTERNAL, CV_CHAIN_APPROX_SIMPLE);
  ROS_INFO("Hay  %ld countornos ", contours.size());

  Mat result;
  int savedContour = -1;
  double maxArea = 0.0;
  // Selects only the biggest contour to avoid error in lighting
  for (int i = 0; i< contours.size(); i++){
    double area = contourArea(contours[i]);
    // The area vaires must be  150 and 10000 to avoid false detections
      if((150 < int(area))&&(int(area)<10000)){
      if (area > maxArea){
        maxArea = area;
        savedContour = i;
      }
    }
  }
  if(contours.size()==0){
      //gb_dialog::ExampleDF forwarder;

    String a = "no cube";
    //forwarder.say(a);
         
  }

  if((150 < int(maxArea))&&(int(maxArea)<10000)){
    ROS_INFO("max area es  %d countornos ", int(maxArea)); 
    

    //Create mask
    drawContours(out_image, contours, savedContour, Scalar(0, 255, 0), 2);


    Point center;
    int64 x_sector = -100;
    int64 y_sector = -100;

    contours[savedContour];

    //Draw circles and detect sector
    int x2 = contours[savedContour][0].x ;
    int y2 = contours[savedContour][0].y ;
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

    circle( out_image, center, 15, color, 3, 8, 0 );

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
      cv::imshow("out_image",out_image);
      cv::waitKey(3);
  return 1;
}

