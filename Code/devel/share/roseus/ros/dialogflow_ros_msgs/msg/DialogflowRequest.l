;; Auto-generated. Do not edit!


(when (boundp 'dialogflow_ros_msgs::DialogflowRequest)
  (if (not (find-package "DIALOGFLOW_ROS_MSGS"))
    (make-package "DIALOGFLOW_ROS_MSGS"))
  (shadow 'DialogflowRequest (find-package "DIALOGFLOW_ROS_MSGS")))
(unless (find-package "DIALOGFLOW_ROS_MSGS::DIALOGFLOWREQUEST")
  (make-package "DIALOGFLOW_ROS_MSGS::DIALOGFLOWREQUEST"))

(in-package "ROS")
;;//! \htmlinclude DialogflowRequest.msg.html


(defclass dialogflow_ros_msgs::DialogflowRequest
  :super ros::object
  :slots (_query_text _contexts ))

(defmethod dialogflow_ros_msgs::DialogflowRequest
  (:init
   (&key
    ((:query_text __query_text) "")
    ((:contexts __contexts) ())
    )
   (send-super :init)
   (setq _query_text (string __query_text))
   (setq _contexts __contexts)
   self)
  (:query_text
   (&optional __query_text)
   (if __query_text (setq _query_text __query_text)) _query_text)
  (:contexts
   (&rest __contexts)
   (if (keywordp (car __contexts))
       (send* _contexts __contexts)
     (progn
       (if __contexts (setq _contexts (car __contexts)))
       _contexts)))
  (:serialization-length
   ()
   (+
    ;; string _query_text
    4 (length _query_text)
    ;; dialogflow_ros_msgs/DialogflowContext[] _contexts
    (apply #'+ (send-all _contexts :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _query_text
       (write-long (length _query_text) s) (princ _query_text s)
     ;; dialogflow_ros_msgs/DialogflowContext[] _contexts
     (write-long (length _contexts) s)
     (dolist (elem _contexts)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _query_text
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _query_text (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; dialogflow_ros_msgs/DialogflowContext[] _contexts
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _contexts (let (r) (dotimes (i n) (push (instance dialogflow_ros_msgs::DialogflowContext :init) r)) r))
     (dolist (elem- _contexts)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get dialogflow_ros_msgs::DialogflowRequest :md5sum-) "4e7c6d1e65dc67cfb4606c28582ad7bf")
(setf (get dialogflow_ros_msgs::DialogflowRequest :datatype-) "dialogflow_ros_msgs/DialogflowRequest")
(setf (get dialogflow_ros_msgs::DialogflowRequest :definition-)
      "string query_text
DialogflowContext[] contexts
================================================================================
MSG: dialogflow_ros_msgs/DialogflowContext
string name
int32 lifespan_count
DialogflowParameter[] parameters
================================================================================
MSG: dialogflow_ros_msgs/DialogflowParameter
string param_name
string[] value
")



(provide :dialogflow_ros_msgs/DialogflowRequest "4e7c6d1e65dc67cfb4606c28582ad7bf")


