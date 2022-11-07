; Auto-generated. Do not edit!


(cl:in-package gb_dialog-msg)


;//! \htmlinclude ActionMsg.msg.html

(cl:defclass <ActionMsg> (roslisp-msg-protocol:ros-message)
  ((mode
    :reader mode
    :initarg :mode
    :type cl:integer
    :initform 0)
   (action
    :reader action
    :initarg :action
    :type cl:string
    :initform "")
   (data
    :reader data
    :initarg :data
    :type cl:string
    :initform ""))
)

(cl:defclass ActionMsg (<ActionMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ActionMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ActionMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gb_dialog-msg:<ActionMsg> is deprecated: use gb_dialog-msg:ActionMsg instead.")))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <ActionMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gb_dialog-msg:mode-val is deprecated.  Use gb_dialog-msg:mode instead.")
  (mode m))

(cl:ensure-generic-function 'action-val :lambda-list '(m))
(cl:defmethod action-val ((m <ActionMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gb_dialog-msg:action-val is deprecated.  Use gb_dialog-msg:action instead.")
  (action m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <ActionMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gb_dialog-msg:data-val is deprecated.  Use gb_dialog-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ActionMsg>) ostream)
  "Serializes a message object of type '<ActionMsg>"
  (cl:let* ((signed (cl:slot-value msg 'mode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'action))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'action))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ActionMsg>) istream)
  "Deserializes a message object of type '<ActionMsg>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mode) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'action) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'action) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'data) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'data) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ActionMsg>)))
  "Returns string type for a message object of type '<ActionMsg>"
  "gb_dialog/ActionMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ActionMsg)))
  "Returns string type for a message object of type 'ActionMsg"
  "gb_dialog/ActionMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ActionMsg>)))
  "Returns md5sum for a message object of type '<ActionMsg>"
  "d5e5c8f51b53e657059a1ed6ff38544d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ActionMsg)))
  "Returns md5sum for a message object of type 'ActionMsg"
  "d5e5c8f51b53e657059a1ed6ff38544d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ActionMsg>)))
  "Returns full string definition for message of type '<ActionMsg>"
  (cl:format cl:nil "int64 mode~%string action~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ActionMsg)))
  "Returns full string definition for message of type 'ActionMsg"
  (cl:format cl:nil "int64 mode~%string action~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ActionMsg>))
  (cl:+ 0
     8
     4 (cl:length (cl:slot-value msg 'action))
     4 (cl:length (cl:slot-value msg 'data))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ActionMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'ActionMsg
    (cl:cons ':mode (mode msg))
    (cl:cons ':action (action msg))
    (cl:cons ':data (data msg))
))
