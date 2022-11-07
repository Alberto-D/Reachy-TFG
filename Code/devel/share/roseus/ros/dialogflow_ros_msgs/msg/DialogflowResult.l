;; Auto-generated. Do not edit!


(when (boundp 'dialogflow_ros_msgs::DialogflowResult)
  (if (not (find-package "DIALOGFLOW_ROS_MSGS"))
    (make-package "DIALOGFLOW_ROS_MSGS"))
  (shadow 'DialogflowResult (find-package "DIALOGFLOW_ROS_MSGS")))
(unless (find-package "DIALOGFLOW_ROS_MSGS::DIALOGFLOWRESULT")
  (make-package "DIALOGFLOW_ROS_MSGS::DIALOGFLOWRESULT"))

(in-package "ROS")
;;//! \htmlinclude DialogflowResult.msg.html


(defclass dialogflow_ros_msgs::DialogflowResult
  :super ros::object
  :slots (_action _query_text _fulfillment_text _parameters _contexts _intent ))

(defmethod dialogflow_ros_msgs::DialogflowResult
  (:init
   (&key
    ((:action __action) "")
    ((:query_text __query_text) "")
    ((:fulfillment_text __fulfillment_text) "")
    ((:parameters __parameters) ())
    ((:contexts __contexts) ())
    ((:intent __intent) "")
    )
   (send-super :init)
   (setq _action (string __action))
   (setq _query_text (string __query_text))
   (setq _fulfillment_text (string __fulfillment_text))
   (setq _parameters __parameters)
   (setq _contexts __contexts)
   (setq _intent (string __intent))
   self)
  (:action
   (&optional __action)
   (if __action (setq _action __action)) _action)
  (:query_text
   (&optional __query_text)
   (if __query_text (setq _query_text __query_text)) _query_text)
  (:fulfillment_text
   (&optional __fulfillment_text)
   (if __fulfillment_text (setq _fulfillment_text __fulfillment_text)) _fulfillment_text)
  (:parameters
   (&rest __parameters)
   (if (keywordp (car __parameters))
       (send* _parameters __parameters)
     (progn
       (if __parameters (setq _parameters (car __parameters)))
       _parameters)))
  (:contexts
   (&rest __contexts)
   (if (keywordp (car __contexts))
       (send* _contexts __contexts)
     (progn
       (if __contexts (setq _contexts (car __contexts)))
       _contexts)))
  (:intent
   (&optional __intent)
   (if __intent (setq _intent __intent)) _intent)
  (:serialization-length
   ()
   (+
    ;; string _action
    4 (length _action)
    ;; string _query_text
    4 (length _query_text)
    ;; string _fulfillment_text
    4 (length _fulfillment_text)
    ;; dialogflow_ros_msgs/DialogflowParameter[] _parameters
    (apply #'+ (send-all _parameters :serialization-length)) 4
    ;; dialogflow_ros_msgs/DialogflowContext[] _contexts
    (apply #'+ (send-all _contexts :serialization-length)) 4
    ;; string _intent
    4 (length _intent)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _action
       (write-long (length _action) s) (princ _action s)
     ;; string _query_text
       (write-long (length _query_text) s) (princ _query_text s)
     ;; string _fulfillment_text
       (write-long (length _fulfillment_text) s) (princ _fulfillment_text s)
     ;; dialogflow_ros_msgs/DialogflowParameter[] _parameters
     (write-long (length _parameters) s)
     (dolist (elem _parameters)
       (send elem :serialize s)
       )
     ;; dialogflow_ros_msgs/DialogflowContext[] _contexts
     (write-long (length _contexts) s)
     (dolist (elem _contexts)
       (send elem :serialize s)
       )
     ;; string _intent
       (write-long (length _intent) s) (princ _intent s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _action
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _action (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _query_text
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _query_text (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _fulfillment_text
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _fulfillment_text (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; dialogflow_ros_msgs/DialogflowParameter[] _parameters
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _parameters (let (r) (dotimes (i n) (push (instance dialogflow_ros_msgs::DialogflowParameter :init) r)) r))
     (dolist (elem- _parameters)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; dialogflow_ros_msgs/DialogflowContext[] _contexts
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _contexts (let (r) (dotimes (i n) (push (instance dialogflow_ros_msgs::DialogflowContext :init) r)) r))
     (dolist (elem- _contexts)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; string _intent
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _intent (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get dialogflow_ros_msgs::DialogflowResult :md5sum-) "7af2326075f5db031043836d68eb1ad3")
(setf (get dialogflow_ros_msgs::DialogflowResult :datatype-) "dialogflow_ros_msgs/DialogflowResult")
(setf (get dialogflow_ros_msgs::DialogflowResult :definition-)
      "string action
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
DialogflowParameter[] parameters
")



(provide :dialogflow_ros_msgs/DialogflowResult "7af2326075f5db031043836d68eb1ad3")


