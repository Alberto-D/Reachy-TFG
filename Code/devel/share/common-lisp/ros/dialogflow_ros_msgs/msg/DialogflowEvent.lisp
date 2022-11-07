; Auto-generated. Do not edit!


(cl:in-package dialogflow_ros_msgs-msg)


;//! \htmlinclude DialogflowEvent.msg.html

(cl:defclass <DialogflowEvent> (roslisp-msg-protocol:ros-message)
  ((event_name
    :reader event_name
    :initarg :event_name
    :type cl:string
    :initform "")
   (parameters
    :reader parameters
    :initarg :parameters
    :type (cl:vector dialogflow_ros_msgs-msg:DialogflowParameter)
   :initform (cl:make-array 0 :element-type 'dialogflow_ros_msgs-msg:DialogflowParameter :initial-element (cl:make-instance 'dialogflow_ros_msgs-msg:DialogflowParameter))))
)

(cl:defclass DialogflowEvent (<DialogflowEvent>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DialogflowEvent>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DialogflowEvent)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dialogflow_ros_msgs-msg:<DialogflowEvent> is deprecated: use dialogflow_ros_msgs-msg:DialogflowEvent instead.")))

(cl:ensure-generic-function 'event_name-val :lambda-list '(m))
(cl:defmethod event_name-val ((m <DialogflowEvent>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dialogflow_ros_msgs-msg:event_name-val is deprecated.  Use dialogflow_ros_msgs-msg:event_name instead.")
  (event_name m))

(cl:ensure-generic-function 'parameters-val :lambda-list '(m))
(cl:defmethod parameters-val ((m <DialogflowEvent>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dialogflow_ros_msgs-msg:parameters-val is deprecated.  Use dialogflow_ros_msgs-msg:parameters instead.")
  (parameters m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DialogflowEvent>) ostream)
  "Serializes a message object of type '<DialogflowEvent>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'event_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'event_name))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'parameters))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'parameters))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DialogflowEvent>) istream)
  "Deserializes a message object of type '<DialogflowEvent>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'event_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'event_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'parameters) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'parameters)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'dialogflow_ros_msgs-msg:DialogflowParameter))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DialogflowEvent>)))
  "Returns string type for a message object of type '<DialogflowEvent>"
  "dialogflow_ros_msgs/DialogflowEvent")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DialogflowEvent)))
  "Returns string type for a message object of type 'DialogflowEvent"
  "dialogflow_ros_msgs/DialogflowEvent")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DialogflowEvent>)))
  "Returns md5sum for a message object of type '<DialogflowEvent>"
  "86c638660c5df1b57b9ebd900d18906f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DialogflowEvent)))
  "Returns md5sum for a message object of type 'DialogflowEvent"
  "86c638660c5df1b57b9ebd900d18906f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DialogflowEvent>)))
  "Returns full string definition for message of type '<DialogflowEvent>"
  (cl:format cl:nil "string event_name~%DialogflowParameter[] parameters~%================================================================================~%MSG: dialogflow_ros_msgs/DialogflowParameter~%string param_name~%string[] value~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DialogflowEvent)))
  "Returns full string definition for message of type 'DialogflowEvent"
  (cl:format cl:nil "string event_name~%DialogflowParameter[] parameters~%================================================================================~%MSG: dialogflow_ros_msgs/DialogflowParameter~%string param_name~%string[] value~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DialogflowEvent>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'event_name))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'parameters) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DialogflowEvent>))
  "Converts a ROS message object to a list"
  (cl:list 'DialogflowEvent
    (cl:cons ':event_name (event_name msg))
    (cl:cons ':parameters (parameters msg))
))
