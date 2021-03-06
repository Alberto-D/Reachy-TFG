#include <ros/ros.h>
#include <std_msgs/String.h>
#include <std_msgs/Int32.h>
#include <std_msgs/Int64.h>

#include <sstream>

#include "dynamixel_sdk_examples/SetPosition.h"
#include "dynamixel_sdk_examples/GetPosition.h"
#include "dynamixel_sdk/dynamixel_sdk.h"

#include "usb_cam/MotorMsg.h"
#include "gb_dialog/ActionMsg.h"
#include <unistd.h>



using namespace dynamixel;

ros::Publisher position_pub;
ros::ServiceClient get_position_srv;
ros::Subscriber motor_msg_sub;

//Returns the position of the motor with the specified id 
int get_position( int id){
  dynamixel_sdk_examples::GetPosition pos;
    pos.request.id = id;
    if (get_position_srv.call(pos)){
      //ROS_INFO("Motor %d is in position: %d",id, pos.response.position);
      return pos.response.position;
    }else{
      ROS_ERROR("Failed to call service get_position");
      return 1;
    }
}

void sector_movement(const usb_cam::MotorMsg::ConstPtr& msg  ){
  int x_sector = msg->x_sector;
  int y_sector = msg->y_sector;

  // Get the sector to move the camera, if it is 1 or 3, look for the object.
  int position_x = get_position(1);
  int position_y = get_position(2);

  dynamixel_sdk_examples::SetPosition position_msg_x;
  dynamixel_sdk_examples::SetPosition position_msg_y;

  if(x_sector==1){
    position_msg_x.id = 1;
    position_msg_x.position = position_x+15;
    position_pub.publish(position_msg_x);
   }else if(x_sector==3){
    dynamixel_sdk_examples::SetPosition msg;
    position_msg_x.id = 1;
    position_msg_x.position = position_x-15;
   position_pub.publish(position_msg_x);
  }

  if(y_sector==1){
    position_msg_y.id = 2;
    position_msg_y.position = position_y-15;
    ROS_INFO("Mando motor a %d",position_msg_y.position);
    position_pub.publish(position_msg_y);
  }else if(y_sector==3){
    dynamixel_sdk_examples::SetPosition msg;
    position_msg_y.id = 2;
    position_msg_y.position = position_y+15;
    position_pub.publish(position_msg_y);
  }

}



// Subscribes to the /motor_msg topic to move the motors so that they allways point to the face
void motor_msg_Callback(const usb_cam::MotorMsg::ConstPtr& msg) {
  ros::Rate timer(5);
  // Control to follow an objective
  if(strcmp("follow", msg->motor_action.c_str())== 0){
    sector_movement(msg);

  }
  // Control for different actions

  //Deny
  else if(strcmp("deny", msg->motor_action.c_str())== 0){
    dynamixel_sdk_examples::SetPosition position_msg;
    int position = get_position(1);
    position_msg.id = 1;
    position_msg.position = position+100;
    position_pub.publish(position_msg);
    timer.sleep();
    position_msg.id = 1;
    position_msg.position = position-100;
    position_pub.publish(position_msg);
    timer.sleep();
    position_msg.id = 1;
    position_msg.position = position;
    position_pub.publish(position_msg);

    // Nod
  }else if(strcmp("nod", msg->motor_action.c_str())== 0){
    dynamixel_sdk_examples::SetPosition position_msg;
    int position = get_position(2);
    position_msg.id = 2;
    position_msg.position = position+50;
    position_pub.publish(position_msg);
    timer.sleep();
    position_msg.id = 2;
    position_msg.position = position-50;
    position_pub.publish(position_msg);
    timer.sleep();
    position_msg.id = 2;
    position_msg.position = position;
    position_pub.publish(position_msg);
    //Turn off
  }else if(strcmp("off", msg->motor_action.c_str())== 0){
    dynamixel_sdk_examples::SetPosition position_msg;
    position_msg.id = 1;
    position_msg.position = 500;
    position_pub.publish(position_msg);
    timer.sleep();
    timer.sleep();
    timer.sleep();
    position_msg.id = 2;
    position_msg.position = 700;
    // Turn on
    position_pub.publish(position_msg);
  }else if(strcmp("on", msg->motor_action.c_str())== 0){
    dynamixel_sdk_examples::SetPosition position_msg;
    position_msg.id = 1;
    position_msg.position = 500;
    position_pub.publish(position_msg);
    timer.sleep();
    timer.sleep();
    timer.sleep();
    position_msg.id = 2;
    position_msg.position = 500;
    position_pub.publish(position_msg);


  //    }else if(strcmp("off", msg->motor_action.c_str())== 0){
  //   dynamixel_sdk_examples::SetPosition position_msg;
  //   position_msg.id = 1;
  //   position_msg.position = 300;
  //   position_pub.publish(position_msg);
  //   timer.sleep();
    
  //   position_msg.id = 2;
  //   position_msg.position = 500;
  //   position_pub.publish(position_msg);
  //   // Turn on
  // }else if(strcmp("on", msg->motor_action.c_str())== 0){

  //   dynamixel_sdk_examples::SetPosition position_msg;
  //   position_msg.id = 1;
  //   position_msg.position = 800;
  //   position_pub.publish(position_msg);
  //   timer.sleep();
    
  //   position_msg.id = 2;
  //   position_msg.position = 500;
  //   position_pub.publish(position_msg);
  }else if(strcmp("think", msg->motor_action.c_str())== 0){
    int position1 = get_position(1);
    int position2 = get_position(2);
    dynamixel_sdk_examples::SetPosition position_msg;
    position_msg.id = 1;
    position_msg.position = 400;
    position_pub.publish(position_msg);
    position_msg.id = 2;
    position_msg.position = 400;
    position_pub.publish(position_msg);
    sleep(1);
    position_msg.id = 1;
    position_msg.position = position1;
    position_pub.publish(position_msg);
    position_msg.id = 2;
    position_msg.position = position2;
    position_pub.publish(position_msg);


  }else if(strcmp("go_left", msg->motor_action.c_str())== 0){
    dynamixel_sdk_examples::SetPosition position_msg;
    int position1 = get_position(1);
    position_msg.id = 1;
    position_msg.position = position1 + 100;
    position_pub.publish(position_msg);
    
  }else if(strcmp("go_right", msg->motor_action.c_str())== 0){
    dynamixel_sdk_examples::SetPosition position_msg;
    int position1 = get_position(1);
    position_msg.id = 1;
    position_msg.position = position1 - 100;
    position_pub.publish(position_msg);
  }
}



int main(int argc, char **argv) {
    int frequency;

    ros::init(argc, argv, "motors");
    ros::NodeHandle nh;

    position_pub = nh.advertise<dynamixel_sdk_examples::SetPosition>("/set_position", 1000);
         
    ros::Rate loop_rate(10);

    motor_msg_sub = nh.subscribe("motor_msg", 1000, motor_msg_Callback);

    get_position_srv = nh.serviceClient<dynamixel_sdk_examples::GetPosition>("/get_position");

  
    while (ros::ok()) {
        ros::spinOnce();
        loop_rate.sleep();
    }
    return 0;
        
    
}


