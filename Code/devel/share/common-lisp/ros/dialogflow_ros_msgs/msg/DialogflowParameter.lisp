; Auto-generated. Do not edit!


(cl:in-package dialogflow_ros_msgs-msg)


;//! \htmlinclude DialogflowParameter.msg.html

(cl:defclass <DialogflowParameter> (roslisp-msg-protocol:ros-message)
  ((param_name
    :reader param_name
    :initarg :param_name
    :type cl:string
    :initform "")
   (value
    :reader value
    :initarg :value
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass DialogflowParameter (<DialogflowParameter>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DialogflowParameter>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DialogflowParameter)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dialogflow_ros_msgs-msg:<DialogflowParameter> is deprecated: use dialogflow_ros_msgs-msg:DialogflowParameter instead.")))

(cl:ensure-generic-function 'param_name-val :lambda-list '(m))
(cl:defmethod param_name-val ((m <DialogflowParameter>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dialogflow_ros_msgs-msg:param_name-val is deprecated.  Use dialogflow_ros_msgs-msg:param_name instead.")
  (param_name m))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <DialogflowParameter>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dialogflow_ros_msgs-msg:value-val is deprecated.  Use dialogflow_ros_msgs-msg:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DialogflowParameter>) ostream)
  "Serializes a message object of type '<DialogflowParameter>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'param_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'param_name))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'value))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DialogflowParameter>) istream)
  "Deserializes a message object of type '<DialogflowParameter>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'param_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'param_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'value) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'value)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DialogflowParameter>)))
  "Returns string type for a message object of type '<DialogflowParameter>"
  "dialogflow_ros_msgs/DialogflowParameter")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DialogflowParameter)))
  "Returns string type for a message object of type 'DialogflowParameter"
  "dialogflow_ros_msgs/DialogflowParameter")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DialogflowParameter>)))
  "Returns md5sum for a message object of type '<DialogflowParameter>"
  "7c0d6bbe30a09bc819df8f08f331971d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DialogflowParameter)))
  "Returns md5sum for a message object of type 'DialogflowParameter"
  "7c0d6bbe30a09bc819df8f08f331971d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DialogflowParameter>)))
  "Returns full string definition for message of type '<DialogflowParameter>"
  (cl:format cl:nil "string param_name~%string[] value~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DialogflowParameter)))
  "Returns full string definition for message of type 'DialogflowParameter"
  (cl:format cl:nil "string param_name~%string[] value~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DialogflowParameter>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'param_name))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'value) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DialogflowParameter>))
  "Converts a ROS message object to a list"
  (cl:list 'DialogflowParameter
    (cl:cons ':param_name (param_name msg))
    (cl:cons ':value (value msg))
))
