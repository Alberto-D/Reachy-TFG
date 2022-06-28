#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <opencv2/highgui/highgui.hpp>
#include <cv_bridge/cv_bridge.h>
#include <opencv2/opencv.hpp>
#include <memory>
#include <std_msgs/Int64.h>

#include "usb_cam/SectorMsg.h"
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




#define FOLLOW_PERSON    1
#define FOLLOW_CUBE    2


using namespace std;
using namespace cv;

int64 face_image_processing(const cv::Mat in_image);
int64 color_image_processing(const cv::Mat in_image);

// For face detection
CascadeClassifier faceCascade; 
String faceCascadePath;
string cascadeName, nestedCascadeName;
Mat frame, image;
Scalar color = Scalar(255, 0, 0);
queue<int> equis;
// To change the mode between follow person and follow cube
int image_mode = FOLLOW_CUBE;

// Sector publisher
//ros::Publisher sector_pub;
ros::Publisher sector_pub;
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
    else
      int64 sector = cube_image_processing(image_raw);

  }
  catch (cv_bridge::Exception& e){
    ROS_ERROR("Could not convert from '%s' to 'bgr8'.", msg->encoding.c_str());
  }
}

// Subscribes to the /action topic 
void actionCallback(const gb_dialog::ActionMsg::ConstPtr& msg) {
  image_mode = msg->action;

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

  // sector_pub = nh.advertise<std_msgs::Int64>("sector", 1000);

  sector_pub = nh.advertise<usb_cam::SectorMsg>("sector", 1000);

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
  faceCascade.detectMultiScale(frameGray, faces);

  Point center;
  int64 x_sector = -100;
  int64 y_sector = -100;
  int x2;
  int y2;

  //Draw circles and detect sector
  for ( size_t i = 0; i < faces.size(); i++ ){
    x2 = faces[i].x + faces[i].width/2;
    y2 = faces[i].y + faces[i].height/2;
    center.x = x2;
    center.y = y2;

  // // Check position with last point to avoid false detections.
  //   equis.push(x2);
  //   if(equis.size()>10)
  //     equis.pop();
    if((0<x2)&&(x2<out_image.cols/3)){
      x_sector = 1;
      //cout << "SECTOR 1" << endl;
    }else if((out_image.cols/3<x2)&&(x2<2*out_image.cols/3)){
      x_sector = 2;
      //cout << "SECTOR 2" << endl;
    }else{
      x_sector = 3;
      //cout << "SECTOR 3" << endl;
    }

    if((0<y2)&&(y2<out_image.rows/3)){
      y_sector = 1;
      //cout << "SECTOR 1" << endl;
    }else if((out_image.rows/3<y2)&&(y2<2*out_image.rows/3)){
      y_sector = 2;
      //cout << "SECTOR 2" << endl;
    }else{
      y_sector = 3;
      //cout << "SECTOR 3" << endl;
    }
    circle( out_image, center, 5, color, 3, 8, 0 );
  }

 // sector_pub.publish(msg);
  usb_cam::SectorMsg msg;
  msg.x_sector = x_sector;
  msg.y_sector = y_sector;

  msg.x=x2;
  msg.y=y2;

  sector_pub.publish(msg);

  // Show image in a different window
      cv::imshow("out_image",out_image);
  cv::waitKey(3);
  return 1;
}



const String window_capture_name = "Video Capture";
const String window_detection_name = "Object Detection";


// Limits to detect the colors

cv::Scalar yellowLow = cv::Scalar(25, 130, 180);
cv::Scalar yellowHigh = cv::Scalar(45, 255, 255);

cv::Scalar redLow = cv::Scalar(120, 160, 90);
cv::Scalar redHigh = cv::Scalar(180, 255, 255);

cv::Scalar blueLow = cv::Scalar(100, 150, 120);
cv::Scalar blueHigh = cv::Scalar(140, 255, 255);







int thresh = 50, N = 5;
const char* wndname = "Square Detection Demo";

// helper function:
// finds a cosine of angle between vectors
// from pt0->pt1 and from pt0->pt2
static double angle( Point pt1, Point pt2, Point pt0 )
{
    double dx1 = pt1.x - pt0.x;
    double dy1 = pt1.y - pt0.y;
    double dx2 = pt2.x - pt0.x;
    double dy2 = pt2.y - pt0.y;
    return (dx1*dx2 + dy1*dy2)/sqrt((dx1*dx1 + dy1*dy1)*(dx2*dx2 + dy2*dy2) + 1e-10);
}

// returns sequence of squares detected on the image.
// the sequence is stored in the specified memory storage
static void findSquares( const Mat& image, vector<vector<Point> >& squares )
{
    squares.clear();

//s    Mat pyr, timg, gray0(image.size(), CV_8U), gray;

    // down-scale and upscale the image to filter out the noise
    //pyrDown(image, pyr, Size(image.cols/2, image.rows/2));
    //pyrUp(pyr, timg, image.size());


    // blur will enhance edge detection
    Mat timg(image);
    medianBlur(image, timg, 9);
    Mat gray0(timg.size(), CV_8U), gray;

    vector<vector<Point> > contours;

    // find squares in every color plane of the image
    for( int c = 0; c < 3; c++ ){
        int ch[] = {c, 0};

        // try several threshold levels
        for( int l = 0; l < N; l++ )
        {
            // hack: use Canny instead of zero threshold level.
          

            // find contours and store them all as a list
            findContours(image, contours, RETR_LIST, CHAIN_APPROX_SIMPLE);

            vector<Point> approx;

            // test each contour
            for( size_t i = 0; i < contours.size(); i++ )
            {
                // approximate contour with accuracy proportional
                // to the contour perimeter
                approxPolyDP(Mat(contours[i]), approx, arcLength(Mat(contours[i]), true)*0.02, true);

                // square contours should have 4 vertices after approximation
                // relatively large area (to filter out noisy contours)
                // and be convex.
                // Note: absolute value of an area is used because
                // area may be positive or negative - in accordance with the
                // contour orientation
                if( approx.size() == 4 &&
                    fabs(contourArea(Mat(approx))) > 1000 &&
                    isContourConvex(Mat(approx)) )
                {
                    double maxCosine = 0;

                    for( int j = 2; j < 5; j++ )
                    {
                        // find the maximum cosine of the angle between joint edges
                        double cosine = fabs(angle(approx[j%4], approx[j-2], approx[j-1]));
                        maxCosine = MAX(maxCosine, cosine);
                    }

                    // if cosines of all angles are small
                    // (all angles are ~90 degree) then write quandrange
                    // vertices to resultant sequence
                    if( maxCosine < 0.3 )
                        squares.push_back(approx);
                }
            }
        }
    }
}


// the function draws all the squares in the image
static void drawSquares( Mat& image, const vector<vector<Point> >& squares )
{
    for( size_t i = 0; i < squares.size(); i++ )
    {
        const Point* p = &squares[i][0];

        int n = (int)squares[i].size();
        //dont detect the border
        if (p-> x > 3 && p->y > 3)
          polylines(image, &p, &n, 1, true, Scalar(0,255,0), 3, LINE_AA);
    }

    imshow(wndname, image);
}

int64 cube_image_processing(const cv::Mat in_image){
  // Create output image
  cv::Mat out_image = in_image.clone();
  // Detect faces
  Mat frameGray;
  std::vector<Rect> faces;

  namedWindow(window_capture_name);
   namedWindow(window_detection_name);

    
    Mat frame, frame_HSV, frame_threshold;
    // Convert from BGR to HSV colorspace
    cvtColor(in_image, frame_HSV, COLOR_BGR2HSV);
    // Detect the object based on HSV Range Values
    inRange(frame_HSV, yellowLow, yellowHigh, frame_threshold);
    // Show the frames
    imshow(window_detection_name, frame_threshold);










        vector<vector<Point> > squares;
        findSquares(frame_threshold, squares);
        drawSquares(out_image, squares);







  faceCascade.detectMultiScale(frameGray, faces);





  Point center;
  int64 sector = -100;

  // //Draw circles and detect sector
  // for ( size_t i = 0; i < faces.size(); i++ ){
  //   int x2 = faces[i].x + faces[i].width/2;
  //   int y2 = faces[i].y + faces[i].height/2;
  //   center.x = x2;
  //   center.y = y2;

  // // // Check position with last point to avoid false detections.
  // //   equis.push(x2);
  // //   if(equis.size()>10)
  // //     equis.pop();
  //   if((0<x2)&&(x2<out_image.cols/3)){
  //     sector = 1;
  //     //cout << "SECTOR 1" << endl;
  //   }else if((out_image.cols/3<x2)&&(x2<2*out_image.cols/3)){
  //     sector = 2;
  //     //cout << "SECTOR 2" << endl;
  //   }else{
  //     sector = 3;
  //     //cout << "SECTOR 3" << endl;
  //   }
  //   if((0<y2)&&(y2<out_image.rows/3)){
  //     sector += 10;
  //     //cout << "SECTOR 1" << endl;
  //   }else if((out_image.rows/3<y2)&&(y2<2*out_image.rows/3)){
  //     sector += 20;
  //     //cout << "SECTOR 2" << endl;
  //   }else{
  //     sector += 30;
  //     //cout << "SECTOR 3" << endl;
  //   }

  //   circle( out_image, center, 15, color, 3, 8, 0 );
  // }

  // Show image in a different window
      cv::imshow("out_image",out_image);
  cv::waitKey(3);
  return 1;
}

