#include <talker.h>
#include <ros/ros.h>
#include <std_msgs/String.h>
#include <tf/transform_broadcaster.h>
#include <sstream>
#include "beginner_tutorials/updateString.h"


/// An external string message to make it accesible in different scope
Message mesg;

/**
 * @brief A function to update the default string of talker
 * @param beginner_tutorials::updateString::Request request the new string from client
 * @param beginner_tutorials::updateString::Response response of the service
 * @return true if the service execution is sucessful
 */
bool update(beginner_tutorials::updateString::Request &request,
            beginner_tutorials::updateString::Response &response) {
    /// Update the string
    response.updatedString = request.newString;
    mesg.message = response.updatedString;
    return true;
}

/**
 * @brief Main function implementation to publish to 'chatter' topic and
 * print the message and run a service simultaneously to change the sring message
 * @param argc Number of parameters passed in command line
 * @param argv Character pointer array pointing to the passed arguments
 * @return 0 When the execution is successful
 * @return 1 When fatal error stream is reached
 */
int main(int argc, char **argv) {
    int frequency;
    /// Initialize ROS node
    ros::init(argc, argv, "talker");

    /// Initialize broadcaster and frame
    static tf::TransformBroadcaster br;
    tf::Transform transform;
    tf::Quaternion q;

  
    /// Check number of arguments to log messages
    if (argc == 2 || argc == 1) {
        /// Case when frequency argument is passed
        if (argc == 2) {
            frequency = atoi(argv[1]);
        }

        /// Case when no frequency argument is passed
        if (argc == 1) {
            ROS_ERROR_STREAM_ONCE("Arguments missing: 'rate'");
            ROS_WARN_STREAM("Setting default frequency as 10 Hz");
            frequency = 10;
        }
        /// Case when negative frequency argument is passed
        if (frequency <= 0) {
            ROS_FATAL_STREAM("Frequency not valid! Enter positive value: ");
            ros::shutdown();
            return 1;
        } else {
            /// Create an instance of NodeHandle
            ros::NodeHandle n;
            /// Create a pubisher node to publish 'chatter' topic
            ros::Publisher chatter_pub = n.advertise<\
                            std_msgs::String>("chatter", 1000);
         
            ros::Rate loop_rate(frequency);
            /// Initialize the count
            int count = 0;
            while (ros::ok()) {
                /// Create debug message to display the frequency value
                ROS_DEBUG_STREAM("Frequency is: " << frequency);
                /// Crate string message
                std_msgs::String msg;
                std::stringstream ss;
                ss << "Publish message number "<< count;
                msg.data = ss.str();
                /// Display the message
                ROS_INFO("%s", msg.data.c_str());
                /// Publish the message using publisher object
                chatter_pub.publish(msg);
                /// Set origin for the tf frame and set the orientation
                transform.setOrigin(tf::Vector3(10.0, 5.0, 6.0));
                q.setRPY(5, 10, 1);
                transform.setRotation(q);
                /// Pass the tf into the broadcaster
                br.sendTransform(tf::StampedTransform(transform, \
                     ros::Time::now(), "world", "talk"));
                /// Command to execute all pending callbacks from all nodes
                ros::spinOnce();
                loop_rate.sleep();
                ++count;
            }
            return 0;
        }
    }
}


