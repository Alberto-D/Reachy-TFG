#include <ros/ros.h>
#include <std_msgs/String.h>
#include <std_msgs/Int32.h>
#include <std_msgs/Int64.h>

#include <sstream>

#include "dynamixel_sdk_examples/SetPosition.h"
#include "dynamixel_sdk_examples/GetPosition.h"
#include "dynamixel_sdk/dynamixel_sdk.h"

#include "usb_cam/SectorMsg.h"
#include "gb_dialog/ActionMsg.h"



using namespace dynamixel;

ros::Publisher position_pub;
ros::ServiceClient get_position_srv;
ros::Subscriber sector_sub;

//Returns the position of the motor with the specified id 
int get_position( int id){
  dynamixel_sdk_examples::GetPosition pos;
    pos.request.id = 1;
    if (get_position_srv.call(pos)){
      ROS_INFO("Motor %d is in position: %d",id, pos.response.position);
      return pos.response.position;
    }else{
      ROS_ERROR("Failed to call service get_position");
      return 1;
    }
}

// Subscribes to the /sector topic to move the motors so that they allways point to the face
void sectorCallback(const usb_cam::SectorMsg::ConstPtr& msg) {
  int x_sector = msg->x_sector;
  int y_sector = msg->y_sector;

  ROS_INFO("Face in sector : %d, x : %ld , y: %ld", x_sector,msg->x, msg->y);
  int position = get_position(1);
  if(x_sector==1){
    dynamixel_sdk_examples::SetPosition msg;
    msg.id = 1;
    msg.position = position+10;
    position_pub.publish(msg);
  }
  if(x_sector==3){
    dynamixel_sdk_examples::SetPosition msg;
    msg.id = 1;
    msg.position = position-10;
    position_pub.publish(msg);
  }

}

int main(int argc, char **argv) {
    int frequency;

    
    ros::init(argc, argv, "motors");
    ros::NodeHandle nh;

    position_pub = nh.advertise<dynamixel_sdk_examples::SetPosition>("/set_position", 1000);
         
    ros::Rate loop_rate(10);
    dynamixel_sdk_examples::SetPosition msg;

    int count = 0;
    int eso = 700;
    msg.id = 1;

    sector_sub = nh.subscribe("sector", 1000, sectorCallback);

    get_position_srv = nh.serviceClient<dynamixel_sdk_examples::GetPosition>("/get_position");

   

      //ros::ServiceServer get_position_srv = nh.advertiseService("/get_position", getPresentPositionCallback);

    while (ros::ok()) {
        ros::spinOnce();
        loop_rate.sleep();
    }
    return 0;
        
    
}


