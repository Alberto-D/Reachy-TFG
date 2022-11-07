; Auto-generated. Do not edit!


(cl:in-package usb_cam-msg)


;//! \htmlinclude MotorMsg.msg.html

(cl:defclass <MotorMsg> (roslisp-msg-protocol:ros-message)
  ((x_sector
    :reader x_sector
    :initarg :x_sector
    :type cl:integer
    :initform 0)
   (y_sector
    :reader y_sector
    :initarg :y_sector
    :type cl:integer
    :initform 0)
   (x
    :reader x
    :initarg :x
    :type cl:integer
    :initform 0)
   (y
    :reader y
    :initarg :y
    :type cl:integer
    :initform 0)
   (motor_action
    :reader motor_action
    :initarg :motor_action
    :type cl:string
    :initform ""))
)

(cl:defclass MotorMsg (<MotorMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MotorMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MotorMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name usb_cam-msg:<MotorMsg> is deprecated: use usb_cam-msg:MotorMsg instead.")))

(cl:ensure-generic-function 'x_sector-val :lambda-list '(m))
(cl:defmethod x_sector-val ((m <MotorMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader usb_cam-msg:x_sector-val is deprecated.  Use usb_cam-msg:x_sector instead.")
  (x_sector m))

(cl:ensure-generic-function 'y_sector-val :lambda-list '(m))
(cl:defmethod y_sector-val ((m <MotorMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader usb_cam-msg:y_sector-val is deprecated.  Use usb_cam-msg:y_sector instead.")
  (y_sector m))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <MotorMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader usb_cam-msg:x-val is deprecated.  Use usb_cam-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <MotorMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader usb_cam-msg:y-val is deprecated.  Use usb_cam-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'motor_action-val :lambda-list '(m))
(cl:defmethod motor_action-val ((m <MotorMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader usb_cam-msg:motor_action-val is deprecated.  Use usb_cam-msg:motor_action instead.")
  (motor_action m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MotorMsg>) ostream)
  "Serializes a message object of type '<MotorMsg>"
  (cl:let* ((signed (cl:slot-value msg 'x_sector)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y_sector)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'motor_action))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'motor_action))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MotorMsg>) istream)
  "Deserializes a message object of type '<MotorMsg>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x_sector) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y_sector) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'motor_action) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'motor_action) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MotorMsg>)))
  "Returns string type for a message object of type '<MotorMsg>"
  "usb_cam/MotorMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MotorMsg)))
  "Returns string type for a message object of type 'MotorMsg"
  "usb_cam/MotorMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MotorMsg>)))
  "Returns md5sum for a message object of type '<MotorMsg>"
  "d31343a4c82aa80a88c6a541c909111d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MotorMsg)))
  "Returns md5sum for a message object of type 'MotorMsg"
  "d31343a4c82aa80a88c6a541c909111d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MotorMsg>)))
  "Returns full string definition for message of type '<MotorMsg>"
  (cl:format cl:nil "int64 x_sector~%int64 y_sector~%int64 x~%int64 y~%string motor_action~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MotorMsg)))
  "Returns full string definition for message of type 'MotorMsg"
  (cl:format cl:nil "int64 x_sector~%int64 y_sector~%int64 x~%int64 y~%string motor_action~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MotorMsg>))
  (cl:+ 0
     8
     8
     8
     8
     4 (cl:length (cl:slot-value msg 'motor_action))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MotorMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'MotorMsg
    (cl:cons ':x_sector (x_sector msg))
    (cl:cons ':y_sector (y_sector msg))
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':motor_action (motor_action msg))
))
