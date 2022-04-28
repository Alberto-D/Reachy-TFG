#include <ros/ros.h>
#include <std_msgs/String.h>

/**
 * @brief A callback function to print the message on terminal
 * @param std_msgs::String::ConstPtr& A string published by publisher node
 * @return None
 */
void chatterCallback(const std_msgs::String::ConstPtr& msg) {
  ROS_INFO("Message Received : [%s]", msg->data.c_str());
}

/**
 * @brief Main function implementation to subscribe to 'chatter' topic and 
 * print the message
 * @param argc Number of parameters passed in command line
 * @param argv Character pointer array pointing to the passed arguments
 * @return 0 When the execution is successful
 */
int main(int argc, char **argv) {
  /// Initilize ROS node
  ros::init(argc, argv, "listener");

  ///  Create an instsance of NodeHandle
  ros::NodeHandle n;

  ///  Create a subscriber node to subscribe 'chatter' topic
  ros::Subscriber sub = n.subscribe("chatter", 1000, chatterCallback);

  ///  Wait for callbacks and execute until node shuts down
  ros::spin();
  return 0;
}
