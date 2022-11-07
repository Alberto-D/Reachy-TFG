;; Auto-generated. Do not edit!


(when (boundp 'dialogflow_ros_msgs::DialogflowService)
  (if (not (find-package "DIALOGFLOW_ROS_MSGS"))
    (make-package "DIALOGFLOW_ROS_MSGS"))
  (shadow 'DialogflowService (find-package "DIALOGFLOW_ROS_MSGS")))
(unless (find-package "DIALOGFLOW_ROS_MSGS::DIALOGFLOWSERVICE")
  (make-package "DIALOGFLOW_ROS_MSGS::DIALOGFLOWSERVICE"))
(unless (find-package "DIALOGFLOW_ROS_MSGS::DIALOGFLOWSERVICEREQUEST")
  (make-package "DIALOGFLOW_ROS_MSGS::DIALOGFLOWSERVICEREQUEST"))
(unless (find-package "DIALOGFLOW_ROS_MSGS::DIALOGFLOWSERVICERESPONSE")
  (make-package "DIALOGFLOW_ROS_MSGS::DIALOGFLOWSERVICERESPONSE"))

(in-package "ROS")





(defclass dialogflow_ros_msgs::DialogflowServiceRequest
  :super ros::object
  :slots (_voice _text ))

(defmethod dialogflow_ros_msgs::DialogflowServiceRequest
  (:init
   (&key
    ((:voice __voice) nil)
    ((:text __text) "")
    )
   (send-super :init)
   (setq _voice __voice)
   (setq _text (string __text))
   self)
  (:voice
   (&optional (__voice :null))
   (if (not (eq __voice :null)) (setq _voice __voice)) _voice)
  (:text
   (&optional __text)
   (if __text (setq _text __text)) _text)
  (:serialization-length
   ()
   (+
    ;; bool _voice
    1
    ;; string _text
    4 (length _text)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _voice
       (if _voice (write-byte -1 s) (write-byte 0 s))
     ;; string _text
       (write-long (length _text) s) (princ _text s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _voice
     (setq _voice (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _text
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _text (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass dialogflow_ros_msgs::DialogflowServiceResponse
  :super ros::object
  :slots (_success _result ))

(defmethod dialogflow_ros_msgs::DialogflowServiceResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:result __result) (instance dialogflow_ros_msgs::DialogflowResult :init))
    )
   (send-super :init)
   (setq _success __success)
   (setq _result __result)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:result
   (&rest __result)
   (if (keywordp (car __result))
       (send* _result __result)
     (progn
       (if __result (setq _result (car __result)))
       _result)))
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; dialogflow_ros_msgs/DialogflowResult _result
    (send _result :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; dialogflow_ros_msgs/DialogflowResult _result
       (send _result :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; dialogflow_ros_msgs/DialogflowResult _result
     (send _result :deserialize buf ptr-) (incf ptr- (send _result :serialization-length))
   ;;
   self)
  )

(defclass dialogflow_ros_msgs::DialogflowService
  :super ros::object
  :slots ())

(setf (get dialogflow_ros_msgs::DialogflowService :md5sum-) "70029259094fc3123850886da266641c")
(setf (get dialogflow_ros_msgs::DialogflowService :datatype-) "dialogflow_ros_msgs/DialogflowService")
(setf (get dialogflow_ros_msgs::DialogflowService :request) dialogflow_ros_msgs::DialogflowServiceRequest)
(setf (get dialogflow_ros_msgs::DialogflowService :response) dialogflow_ros_msgs::DialogflowServiceResponse)

(defmethod dialogflow_ros_msgs::DialogflowServiceRequest
  (:response () (instance dialogflow_ros_msgs::DialogflowServiceResponse :init)))

(setf (get dialogflow_ros_msgs::DialogflowServiceRequest :md5sum-) "70029259094fc3123850886da266641c")
(setf (get dialogflow_ros_msgs::DialogflowServiceRequest :datatype-) "dialogflow_ros_msgs/DialogflowServiceRequest")
(setf (get dialogflow_ros_msgs::DialogflowServiceRequest :definition-)
      "bool voice
string text
---
bool success
DialogflowResult result

================================================================================
MSG: dialogflow_ros_msgs/DialogflowResult
string action
string query_text
string fulfillment_text
DialogflowParameter[] parameters
DialogflowContext[] contexts
string intent
================================================================================
MSG: dialogflow_ros_msgs/DialogflowParameter
string param_name
string[] value
================================================================================
MSG: dialogflow_ros_msgs/DialogflowContext
string name
int32 lifespan_count
")

(setf (get dialogflow_ros_msgs::DialogflowServiceResponse :md5sum-) "70029259094fc3123850886da266641c")
(setf (get dialogflow_ros_msgs::DialogflowServiceResponse :datatype-) "dialogflow_ros_msgs/DialogflowServiceResponse")
(setf (get dialogflow_ros_msgs::DialogflowServiceResponse :definition-)
      "bool voice
string text
---
bool success
DialogflowResult result

================================================================================
MSG: dialogflow_ros_msgs/DialogflowResult
string action
string query_text
string fulfillment_text
DialogflowParameter[] parameters
DialogflowContext[] contexts
string intent
================================================================================
MSG: dialogflow_ros_msgs/DialogflowParameter
string param_name
string[] value
================================================================================
MSG: dialogflow_ros_msgs/DialogflowContext
string name
int32 lifespan_count
")



(provide :dialogflow_ros_msgs/DialogflowService "70029259094fc3123850886da266641c")


