;; Auto-generated. Do not edit!


(when (boundp 'dialogflow_ros_msgs::DialogflowEvent)
  (if (not (find-package "DIALOGFLOW_ROS_MSGS"))
    (make-package "DIALOGFLOW_ROS_MSGS"))
  (shadow 'DialogflowEvent (find-package "DIALOGFLOW_ROS_MSGS")))
(unless (find-package "DIALOGFLOW_ROS_MSGS::DIALOGFLOWEVENT")
  (make-package "DIALOGFLOW_ROS_MSGS::DIALOGFLOWEVENT"))

(in-package "ROS")
;;//! \htmlinclude DialogflowEvent.msg.html


(defclass dialogflow_ros_msgs::DialogflowEvent
  :super ros::object
  :slots (_event_name _parameters ))

(defmethod dialogflow_ros_msgs::DialogflowEvent
  (:init
   (&key
    ((:event_name __event_name) "")
    ((:parameters __parameters) ())
    )
   (send-super :init)
   (setq _event_name (string __event_name))
   (setq _parameters __parameters)
   self)
  (:event_name
   (&optional __event_name)
   (if __event_name (setq _event_name __event_name)) _event_name)
  (:parameters
   (&rest __parameters)
   (if (keywordp (car __parameters))
       (send* _parameters __parameters)
     (progn
       (if __parameters (setq _parameters (car __parameters)))
       _parameters)))
  (:serialization-length
   ()
   (+
    ;; string _event_name
    4 (length _event_name)
    ;; dialogflow_ros_msgs/DialogflowParameter[] _parameters
    (apply #'+ (send-all _parameters :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _event_name
       (write-long (length _event_name) s) (princ _event_name s)
     ;; dialogflow_ros_msgs/DialogflowParameter[] _parameters
     (write-long (length _parameters) s)
     (dolist (elem _parameters)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _event_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _event_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; dialogflow_ros_msgs/DialogflowParameter[] _parameters
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _parameters (let (r) (dotimes (i n) (push (instance dialogflow_ros_msgs::DialogflowParameter :init) r)) r))
     (dolist (elem- _parameters)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get dialogflow_ros_msgs::DialogflowEvent :md5sum-) "86c638660c5df1b57b9ebd900d18906f")
(setf (get dialogflow_ros_msgs::DialogflowEvent :datatype-) "dialogflow_ros_msgs/DialogflowEvent")
(setf (get dialogflow_ros_msgs::DialogflowEvent :definition-)
      "string event_name
DialogflowParameter[] parameters
================================================================================
MSG: dialogflow_ros_msgs/DialogflowParameter
string param_name
string[] value
")



(provide :dialogflow_ros_msgs/DialogflowEvent "86c638660c5df1b57b9ebd900d18906f")


