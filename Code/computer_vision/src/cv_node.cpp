#include <memory>

#include "rclcpp/rclcpp.hpp"
#include "std_msgs/msg/string.hpp"
#include "std_msgs/msg/int64.hpp"

#include "sensor_msgs/msg/image.hpp"
#include "sensor_msgs/msg/point_cloud2.hpp"
#include <image_transport/image_transport.hpp>

#include <memory>
#include "cv_bridge/cv_bridge.h"
#include <opencv2/opencv.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>

#include "rclcpp/rclcpp.hpp"
#include "std_msgs/msg/string.hpp"

#include "/usr/local/include/opencv4/opencv2/objdetect.hpp"
#include "/usr/local/include/opencv4/opencv2/highgui.hpp"
#include "/usr/local/include/opencv4/opencv2/imgproc.hpp"
#include <iostream>
#include <queue>

using namespace std;
using namespace cv;

// Function for Face Detection
void detectAndDraw( Mat& img, CascadeClassifier& cascade, 
                CascadeClassifier& nestedCascade, double scale );
string cascadeName, nestedCascadeName;

Mat frame, image;
Scalar color = Scalar(255, 0, 0);


queue<int> equis;

CascadeClassifier faceCascade; 
String faceCascadePath;
	    


cv::Mat image_processing(const cv::Mat in_image);
rclcpp::Publisher<std_msgs::msg::Int64>::SharedPtr sector_publisher;

class ComputerVisionSubscriber : public rclcpp::Node
{
  public:
    ComputerVisionSubscriber()
    : Node("opencv_subscriber")
    {
      auto qos = rclcpp::QoS( rclcpp::QoSInitialization( RMW_QOS_POLICY_HISTORY_KEEP_LAST, 5));
      qos.reliability(RMW_QOS_POLICY_RELIABILITY_BEST_EFFORT);
   

      subscription_ = this->create_subscription<sensor_msgs::msg::Image>(
      "/image_raw", qos, std::bind(&ComputerVisionSubscriber::topic_callback, this, std::placeholders::_1));
      image_publisher = this->create_publisher<sensor_msgs::msg::Image>(
      "cv_image", qos);
      sector_publisher = this->create_publisher<std_msgs::msg::Int64>(
      "sector", qos);

      //For face detection
      faceCascadePath = "/home/alberto/ros2_ws/src/computer_vision/cascade/haarcascade_frontalface_default.xml";
      faceCascade.load( faceCascadePath );

	    

      
    }

  private:
    void topic_callback(const sensor_msgs::msg::Image::SharedPtr msg) const
    {     
      // Convert ROS Image to CV Image
      cv_bridge::CvImagePtr cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
      cv::Mat image_raw =  cv_ptr->image;

      // Image processing
      cv::Mat cv_image = image_processing(image_raw);

      // Convert OpenCV Image to ROS Image
      cv_bridge::CvImage img_bridge = cv_bridge::CvImage(msg->header, sensor_msgs::image_encodings::BGR8, cv_image);
      sensor_msgs::msg::Image out_image; // >> message to be sent
      img_bridge.toImageMsg(out_image); // from cv_bridge to sensor_msgs::Image

      // Publish the data
      image_publisher -> publish(out_image);

    }

    rclcpp::Subscription<sensor_msgs::msg::Image>::SharedPtr subscription_;
    rclcpp::Publisher<sensor_msgs::msg::Image>::SharedPtr image_publisher;
   
};

/**
  TO-DO
*/
cv::Mat image_processing(const cv::Mat in_image) 
{
  // Create output image
  cv::Mat out_image= in_image.clone();
  // Processing
  // Detect faces
  Mat frameGray;
  std::vector<Rect> faces;
  cvtColor( out_image, frameGray, COLOR_BGR2GRAY );

  faceCascade.detectMultiScale(frameGray, faces);
  Point center;

  int64 sector = -1;


  // //Draw circles
  // for ( size_t i = 0; i < faces.size(); i++ ){
  //   int x2 = faces[i].x + faces[i].width/2;
  //   int y2 = faces[i].y + faces[i].height/2;
  //   center.x = x2;
  //   center.y = y2;

  // // Check position with last point to avoid false detections.
  //   equis.push(x2);
  //   if(equis.size()>10)
  //     equis.pop();
        
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

  //   circle( out_image, center, 5, color, 3, 8, 0 );
  // }


  sector_publisher -> publish(sector);


  // Show image in a different window
  //cv::imshow("out_image",out_image);
  //cv::waitKey(3);

  // You must to return a 3-channels image to show it in ROS, so do it with 1-channel images
  //cv::cvtColor(out_image, out_image, cv::COLOR_GRAY2BGR);
  return out_image;
}

int main(int argc, char * argv[])
{
  rclcpp::init(argc, argv);
  rclcpp::spin(std::make_shared<ComputerVisionSubscriber>());
  rclcpp::shutdown();
  return 0;
}
