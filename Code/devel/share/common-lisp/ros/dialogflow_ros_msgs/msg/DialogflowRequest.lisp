; Auto-generated. Do not edit!


(cl:in-package dialogflow_ros_msgs-msg)


;//! \htmlinclude DialogflowRequest.msg.html

(cl:defclass <DialogflowRequest> (roslisp-msg-protocol:ros-message)
  ((query_text
    :reader query_text
    :initarg :query_text
    :type cl:string
    :initform "")
   (contexts
    :reader contexts
    :initarg :contexts
    :type (cl:vector dialogflow_ros_msgs-msg:DialogflowContext)
   :initform (cl:make-array 0 :element-type 'dialogflow_ros_msgs-msg:DialogflowContext :initial-element (cl:make-instance 'dialogflow_ros_msgs-msg:DialogflowContext))))
)

(cl:defclass DialogflowRequest (<DialogflowRequest>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DialogflowRequest>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DialogflowRequest)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dialogflow_ros_msgs-msg:<DialogflowRequest> is deprecated: use dialogflow_ros_msgs-msg:DialogflowRequest instead.")))

(cl:ensure-generic-function 'query_text-val :lambda-list '(m))
(cl:defmethod query_text-val ((m <DialogflowRequest>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dialogflow_ros_msgs-msg:query_text-val is deprecated.  Use dialogflow_ros_msgs-msg:query_text instead.")
  (query_text m))

(cl:ensure-generic-function 'contexts-val :lambda-list '(m))
(cl:defmethod contexts-val ((m <DialogflowRequest>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dialogflow_ros_msgs-msg:contexts-val is deprecated.  Use dialogflow_ros_msgs-msg:contexts instead.")
  (contexts m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DialogflowRequest>) ostream)
  "Serializes a message object of type '<DialogflowRequest>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'query_text))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'query_text))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'contexts))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'contexts))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DialogflowRequest>) istream)
  "Deserializes a message object of type '<DialogflowRequest>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'query_text) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'query_text) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'contexts) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'contexts)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'dialogflow_ros_msgs-msg:DialogflowContext))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DialogflowRequest>)))
  "Returns string type for a message object of type '<DialogflowRequest>"
  "dialogflow_ros_msgs/DialogflowRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DialogflowRequest)))
  "Returns string type for a message object of type 'DialogflowRequest"
  "dialogflow_ros_msgs/DialogflowRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DialogflowRequest>)))
  "Returns md5sum for a message object of type '<DialogflowRequest>"
  "4e7c6d1e65dc67cfb4606c28582ad7bf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DialogflowRequest)))
  "Returns md5sum for a message object of type 'DialogflowRequest"
  "4e7c6d1e65dc67cfb4606c28582ad7bf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DialogflowRequest>)))
  "Returns full string definition for message of type '<DialogflowRequest>"
  (cl:format cl:nil "string query_text~%DialogflowContext[] contexts~%================================================================================~%MSG: dialogflow_ros_msgs/DialogflowContext~%string name~%int32 lifespan_count~%DialogflowParameter[] parameters~%================================================================================~%MSG: dialogflow_ros_msgs/DialogflowParameter~%string param_name~%string[] value~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DialogflowRequest)))
  "Returns full string definition for message of type 'DialogflowRequest"
  (cl:format cl:nil "string query_text~%DialogflowContext[] contexts~%================================================================================~%MSG: dialogflow_ros_msgs/DialogflowContext~%string name~%int32 lifespan_count~%DialogflowParameter[] parameters~%================================================================================~%MSG: dialogflow_ros_msgs/DialogflowParameter~%string param_name~%string[] value~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DialogflowRequest>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'query_text))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'contexts) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DialogflowRequest>))
  "Converts a ROS message object to a list"
  (cl:list 'DialogflowRequest
    (cl:cons ':query_text (query_text msg))
    (cl:cons ':contexts (contexts msg))
))
