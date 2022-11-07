; Auto-generated. Do not edit!


(cl:in-package dialogflow_ros_msgs-msg)


;//! \htmlinclude DialogflowContext.msg.html

(cl:defclass <DialogflowContext> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (lifespan_count
    :reader lifespan_count
    :initarg :lifespan_count
    :type cl:integer
    :initform 0)
   (parameters
    :reader parameters
    :initarg :parameters
    :type (cl:vector dialogflow_ros_msgs-msg:DialogflowParameter)
   :initform (cl:make-array 0 :element-type 'dialogflow_ros_msgs-msg:DialogflowParameter :initial-element (cl:make-instance 'dialogflow_ros_msgs-msg:DialogflowParameter))))
)

(cl:defclass DialogflowContext (<DialogflowContext>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DialogflowContext>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DialogflowContext)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dialogflow_ros_msgs-msg:<DialogflowContext> is deprecated: use dialogflow_ros_msgs-msg:DialogflowContext instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <DialogflowContext>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dialogflow_ros_msgs-msg:name-val is deprecated.  Use dialogflow_ros_msgs-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'lifespan_count-val :lambda-list '(m))
(cl:defmethod lifespan_count-val ((m <DialogflowContext>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dialogflow_ros_msgs-msg:lifespan_count-val is deprecated.  Use dialogflow_ros_msgs-msg:lifespan_count instead.")
  (lifespan_count m))

(cl:ensure-generic-function 'parameters-val :lambda-list '(m))
(cl:defmethod parameters-val ((m <DialogflowContext>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dialogflow_ros_msgs-msg:parameters-val is deprecated.  Use dialogflow_ros_msgs-msg:parameters instead.")
  (parameters m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DialogflowContext>) ostream)
  "Serializes a message object of type '<DialogflowContext>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let* ((signed (cl:slot-value msg 'lifespan_count)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'parameters))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'parameters))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DialogflowContext>) istream)
  "Deserializes a message object of type '<DialogflowContext>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'lifespan_count) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DialogflowContext>)))
  "Returns string type for a message object of type '<DialogflowContext>"
  "dialogflow_ros_msgs/DialogflowContext")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DialogflowContext)))
  "Returns string type for a message object of type 'DialogflowContext"
  "dialogflow_ros_msgs/DialogflowContext")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DialogflowContext>)))
  "Returns md5sum for a message object of type '<DialogflowContext>"
  "5a084e004a74b028dbad6a7fb9f08023")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DialogflowContext)))
  "Returns md5sum for a message object of type 'DialogflowContext"
  "5a084e004a74b028dbad6a7fb9f08023")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DialogflowContext>)))
  "Returns full string definition for message of type '<DialogflowContext>"
  (cl:format cl:nil "string name~%int32 lifespan_count~%DialogflowParameter[] parameters~%================================================================================~%MSG: dialogflow_ros_msgs/DialogflowParameter~%string param_name~%string[] value~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DialogflowContext)))
  "Returns full string definition for message of type 'DialogflowContext"
  (cl:format cl:nil "string name~%int32 lifespan_count~%DialogflowParameter[] parameters~%================================================================================~%MSG: dialogflow_ros_msgs/DialogflowParameter~%string param_name~%string[] value~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DialogflowContext>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'parameters) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DialogflowContext>))
  "Converts a ROS message object to a list"
  (cl:list 'DialogflowContext
    (cl:cons ':name (name msg))
    (cl:cons ':lifespan_count (lifespan_count msg))
    (cl:cons ':parameters (parameters msg))
))
