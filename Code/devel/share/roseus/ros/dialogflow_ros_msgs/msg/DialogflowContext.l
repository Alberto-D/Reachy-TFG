;; Auto-generated. Do not edit!


(when (boundp 'dialogflow_ros_msgs::DialogflowContext)
  (if (not (find-package "DIALOGFLOW_ROS_MSGS"))
    (make-package "DIALOGFLOW_ROS_MSGS"))
  (shadow 'DialogflowContext (find-package "DIALOGFLOW_ROS_MSGS")))
(unless (find-package "DIALOGFLOW_ROS_MSGS::DIALOGFLOWCONTEXT")
  (make-package "DIALOGFLOW_ROS_MSGS::DIALOGFLOWCONTEXT"))

(in-package "ROS")
;;//! \htmlinclude DialogflowContext.msg.html


(defclass dialogflow_ros_msgs::DialogflowContext
  :super ros::object
  :slots (_name _lifespan_count _parameters ))

(defmethod dialogflow_ros_msgs::DialogflowContext
  (:init
   (&key
    ((:name __name) "")
    ((:lifespan_count __lifespan_count) 0)
    ((:parameters __parameters) ())
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _lifespan_count (round __lifespan_count))
   (setq _parameters __parameters)
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:lifespan_count
   (&optional __lifespan_count)
   (if __lifespan_count (setq _lifespan_count __lifespan_count)) _lifespan_count)
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
    ;; string _name
    4 (length _name)
    ;; int32 _lifespan_count
    4
    ;; dialogflow_ros_msgs/DialogflowParameter[] _parameters
    (apply #'+ (send-all _parameters :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; int32 _lifespan_count
       (write-long _lifespan_count s)
     ;; dialogflow_ros_msgs/DialogflowParameter[] _parameters
     (write-long (length _parameters) s)
     (dolist (elem _parameters)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _lifespan_count
     (setq _lifespan_count (sys::peek buf ptr- :integer)) (incf ptr- 4)
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

(setf (get dialogflow_ros_msgs::DialogflowContext :md5sum-) "5a084e004a74b028dbad6a7fb9f08023")
(setf (get dialogflow_ros_msgs::DialogflowContext :datatype-) "dialogflow_ros_msgs/DialogflowContext")
(setf (get dialogflow_ros_msgs::DialogflowContext :definition-)
      "string name
int32 lifespan_count
DialogflowParameter[] parameters
================================================================================
MSG: dialogflow_ros_msgs/DialogflowParameter
string param_name
string[] value
")



(provide :dialogflow_ros_msgs/DialogflowContext "5a084e004a74b028dbad6a7fb9f08023")


