/*********************************************************************
*  Software License Agreement (BSD License)
*
*   Copyright (c) 2018, Intelligent Robotics Labs
*   All rights reserved.
*
*   Redistribution and use in source and binary forms, with or without
*   modification, are permitted provided that the following conditions
*   are met:

*    * Redistributions of source code must retain the above copyright
*      notice, this list of conditions and the following disclaimer.
*    * Redistributions in binary form must reproduce the above
*      copyright notice, this list of conditions and the following
*      disclaimer in the documentation and/or other materials provided
*      with the distribution.
*    * Neither the name of Intelligent Robotics nor the names of its
*      contributors may be used to endorse or promote products derived
*      from this software without specific prior written permission.

*   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
*   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
*   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
*   FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
*   COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
*   INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
*   BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
*   LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
*   CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
*   LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
*   ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
*   POSSIBILITY OF SUCH DAMAGE.
*********************************************************************/

/* Author: Jonatan Gines jginesclavero@gmail.com */

/* Mantainer: Jonatan Gines jginesclavero@gmail.com */
#include <gb_dialog/DialogInterface.h>
#include <string>
#include <std_msgs/Int64.h>
#include "gb_dialog/ActionMsg.h"
#include <ctime>

ros::Publisher action_pub;

// List of actions to publish in /action
#define FOLLOW_PERSON    1
#define FOLLOW_CUBE    2
#define TALK_MODE    3

#define BYE    4

#define NOD    10
#define DENY    20
#define SAD    30
#define HAPPY    40

int actual_mode = 0;



namespace ph = std::placeholders;

namespace gb_dialog{
class ExampleDF: public DialogInterface{
  public:
    ExampleDF(): nh_(){
      this->registerCallback(std::bind(&ExampleDF::noIntentCB, this, ph::_1));
      this->registerCallback(std::bind(&ExampleDF::welcomeIntentCB, this, ph::_1),"Default Welcome Intent");
      this->registerCallback(std::bind(&ExampleDF::byeCB, this, ph::_1),"bye");
      this->registerCallback(std::bind(&ExampleDF::follow_personCB, this, ph::_1),"Follow person");
      this->registerCallback(std::bind(&ExampleDF::follow_ballCB, this, ph::_1),"Follow ball");
      this->registerCallback(std::bind(&ExampleDF::talk_modeCB, this, ph::_1),"Lets talk");
      this->registerCallback(std::bind(&ExampleDF::question_aliveCB, this, ph::_1),"Question alive");
      this->registerCallback(std::bind(&ExampleDF::question_robotCB, this, ph::_1),"Question robot");
      this->registerCallback(std::bind(&ExampleDF::position_leftCB, this, ph::_1),"Position left");
      this->registerCallback(std::bind(&ExampleDF::position_rightCB, this, ph::_1),"Position right");

      this->registerCallback(std::bind(&ExampleDF::jokeCB, this, ph::_1),"Joke");
      this->registerCallback(std::bind(&ExampleDF::Time_questionCB, this, ph::_1),"Time");
      this->registerCallback(std::bind(&ExampleDF::How_questionCB, this, ph::_1),"How are you");
      this->registerCallback(std::bind(&ExampleDF::Where_questionCB, this, ph::_1),"Where are you");
      this->registerCallback(std::bind(&ExampleDF::FactCB, this, ph::_1),"Facts");
      //this->registerCallback(std::bind(&ExampleDF::BuyCB, this, ph::_1),"Buy");
      
      this->registerCallback(std::bind(&ExampleDF::SadCB, this, ph::_1),"Sad");
      this->registerCallback(std::bind(&ExampleDF::HappyCB, this, ph::_1),"Happy");
    }


    void SadCB(dialogflow_ros_msgs::DialogflowResult result){
      gb_dialog::ActionMsg msg;
      msg.mode = TALK_MODE;
      msg.action = "sad";
      action_pub.publish(msg);
      actual_mode = msg.mode;
      ROS_INFO("[ExampleDF] SadCB: intent [%s]", result.intent.c_str());
      speak(result.fulfillment_text);
    }
    void HappyCB(dialogflow_ros_msgs::DialogflowResult result){
      gb_dialog::ActionMsg msg;
      msg.mode = TALK_MODE;
      msg.action = "happy";
      action_pub.publish(msg);
      actual_mode = msg.mode;
      ROS_INFO("[ExampleDF] HappyCB: intent [%s]", result.intent.c_str());
      speak(result.fulfillment_text);
    }


    void noIntentCB(dialogflow_ros_msgs::DialogflowResult result){
      ROS_INFO("[ExampleDF] noIntentCB: intent [%s]", result.intent.c_str());
    }
    void How_questionCB(dialogflow_ros_msgs::DialogflowResult result){
      ROS_INFO("[ExampleDF] how: intent [%s]", result.intent.c_str());
      speak(result.fulfillment_text);
    }
    void Where_questionCB(dialogflow_ros_msgs::DialogflowResult result){
      ROS_INFO("[ExampleDF] how: intent [%s]", result.intent.c_str());
      speak(result.fulfillment_text);
    }
    void FactCB(dialogflow_ros_msgs::DialogflowResult result){
      ROS_INFO("[ExampleDF] FactCB: intent [%s]", result.intent.c_str());
      speak(result.fulfillment_text);
    }
    

    void Time_questionCB(dialogflow_ros_msgs::DialogflowResult result){
      ROS_INFO("[ExampleDF] welcomeIntentCB: intent [%s]", result.intent.c_str());
      time_t now = time(0);
      tm *ltm = localtime(&now);
      std::string time = " It is " + std::to_string(ltm->tm_hour) + "hours and " + std::to_string(ltm->tm_min) + " minutes";
      speak(time);
    }
    void welcomeIntentCB(dialogflow_ros_msgs::DialogflowResult result){
      ROS_INFO("[ExampleDF] welcomeIntentCB: intent [%s]", result.intent.c_str());
      gb_dialog::ActionMsg msg;
      msg.mode = BYE;
      msg.action = "on";
      action_pub.publish(msg);
      sleep(2);
      speak(result.fulfillment_text);
      actual_mode = msg.mode;
    }
    void byeCB(dialogflow_ros_msgs::DialogflowResult result){
      ROS_INFO("[ExampleDF] bye: intent [%s]", result.intent.c_str());
      gb_dialog::ActionMsg msg;
      msg.mode = BYE;
      msg.action = "off";
      speak(result.fulfillment_text);
      sleep(1);
      action_pub.publish(msg);
      actual_mode = msg.mode;
    }
    
    void follow_personCB(dialogflow_ros_msgs::DialogflowResult result){
      ROS_INFO("[Follow person] following: intent [%s]", result.intent.c_str());
      gb_dialog::ActionMsg msg;
      msg.mode = FOLLOW_PERSON;
      msg.action = "follow";
      action_pub.publish(msg);
      speak(result.fulfillment_text);
      actual_mode = msg.mode;
    }
    void follow_ballCB(dialogflow_ros_msgs::DialogflowResult result){
      ROS_INFO("[Follow cube] following  [%s]", result.intent.c_str());
      gb_dialog::ActionMsg msg;
      auto data =  result.parameters[0].value[0];
      msg.data= data.c_str();
      msg.mode = FOLLOW_CUBE;
      msg.action = "follow";
      action_pub.publish(msg);
      speak(result.fulfillment_text);
      actual_mode = msg.mode;
    }
    void talk_modeCB(dialogflow_ros_msgs::DialogflowResult result){
      ROS_INFO("[ExampleDF] talking: intent [%s]", result.intent.c_str());
      gb_dialog::ActionMsg msg;
      msg.mode = TALK_MODE;
      action_pub.publish(msg);
      speak(result.fulfillment_text);
      actual_mode = msg.mode;
    }
    void question_aliveCB(dialogflow_ros_msgs::DialogflowResult result){
      ROS_INFO("Alive question %s", result.intent.c_str());
      gb_dialog::ActionMsg msg;
      msg.mode = TALK_MODE;
      msg.action = "deny";
      action_pub.publish(msg);
      actual_mode = msg.mode;
    }
     void question_robotCB(dialogflow_ros_msgs::DialogflowResult result){
      ROS_INFO("Robot question %s", result.intent.c_str());
      gb_dialog::ActionMsg msg;
      msg.mode = TALK_MODE;
      msg.action = "nod";
      action_pub.publish(msg);
      actual_mode = msg.mode;
    }
    // If you tell Reachy you are at his left, it moves and keep searching
    void position_leftCB(dialogflow_ros_msgs::DialogflowResult result){
      ROS_INFO("On your left, mode es %d",actual_mode );
      int last_mode = actual_mode;
      gb_dialog::ActionMsg msg;
      msg.action = "go_left";
      action_pub.publish(msg);
      sleep(2);
      msg.mode = last_mode;
      msg.action = "follow";
      action_pub.publish(msg);
    }
      // If you tell Reachy you are at his right, it moves and keep searching

    void position_rightCB(dialogflow_ros_msgs::DialogflowResult result){
      ROS_INFO("On your right, mode es %d",actual_mode );
      int last_mode = actual_mode;
      gb_dialog::ActionMsg msg;
      msg.action = "go_right";
      action_pub.publish(msg);
      sleep(2);
      msg.mode = last_mode;
      msg.action = "follow";
      action_pub.publish(msg);
    }
  
    void jokeCB(dialogflow_ros_msgs::DialogflowResult result){
      ROS_INFO("[ExampleDF] joke: intent [%s]", result.intent.c_str());
      gb_dialog::ActionMsg msg;
      msg.mode = TALK_MODE;
      msg.action = "think";
      action_pub.publish(msg);
      sleep(3);
      speak(result.fulfillment_text);
      actual_mode = msg.mode;
    }

  private:
    ros::NodeHandle nh_;
};
}  // namespace gb_dialog

int main(int argc, char** argv){
  ros::init(argc, argv, "Reachy_speech_node");
  gb_dialog::ExampleDF forwarder;
  ros::Rate loop_rate(10);
  ros::NodeHandle action_node;
  action_pub = action_node.advertise<gb_dialog::ActionMsg>("action", 1000);


      
  while (ros::ok()) {
    forwarder.listen();
    ros::spinOnce();
    loop_rate.sleep();

  }
  return 0;
}
