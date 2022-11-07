; Auto-generated. Do not edit!


(cl:in-package dialogflow_ros_msgs-msg)


;//! \htmlinclude DialogflowResult.msg.html

(cl:defclass <DialogflowResult> (roslisp-msg-protocol:ros-message)
  ((action
    :reader action
    :initarg :action
    :type cl:string
    :initform "")
   (query_text
    :reader query_text
    :initarg :query_text
    :type cl:string
    :initform "")
   (fulfillment_text
    :reader fulfillment_text
    :initarg :fulfillment_text
    :type cl:string
    :initform "")
   (parameters
    :reader parameters
    :initarg :parameters
    :type (cl:vector dialogflow_ros_msgs-msg:DialogflowParameter)
   :initform (cl:make-array 0 :element-type 'dialogflow_ros_msgs-msg:DialogflowParameter :initial-element (cl:make-instance 'dialogflow_ros_msgs-msg:DialogflowParameter)))
   (contexts
    :reader contexts
    :initarg :contexts
    :type (cl:vector dialogflow_ros_msgs-msg:DialogflowContext)
   :initform (cl:make-array 0 :element-type 'dialogflow_ros_msgs-msg:DialogflowContext :initial-element (cl:make-instance 'dialogflow_ros_msgs-msg:DialogflowContext)))
   (intent
    :reader intent
    :initarg :intent
    :type cl:string
    :initform ""))
)

(cl:defclass DialogflowResult (<DialogflowResult>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DialogflowResult>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DialogflowResult)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dialogflow_ros_msgs-msg:<DialogflowResult> is deprecated: use dialogflow_ros_msgs-msg:DialogflowResult instead.")))

(cl:ensure-generic-function 'action-val :lambda-list '(m))
(cl:defmethod action-val ((m <DialogflowResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dialogflow_ros_msgs-msg:action-val is deprecated.  Use dialogflow_ros_msgs-msg:action instead.")
  (action m))

(cl:ensure-generic-function 'query_text-val :lambda-list '(m))
(cl:defmethod query_text-val ((m <DialogflowResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dialogflow_ros_msgs-msg:query_text-val is deprecated.  Use dialogflow_ros_msgs-msg:query_text instead.")
  (query_text m))

(cl:ensure-generic-function 'fulfillment_text-val :lambda-list '(m))
(cl:defmethod fulfillment_text-val ((m <DialogflowResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dialogflow_ros_msgs-msg:fulfillment_text-val is deprecated.  Use dialogflow_ros_msgs-msg:fulfillment_text instead.")
  (fulfillment_text m))

(cl:ensure-generic-function 'parameters-val :lambda-list '(m))
(cl:defmethod parameters-val ((m <DialogflowResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dialogflow_ros_msgs-msg:parameters-val is deprecated.  Use dialogflow_ros_msgs-msg:parameters instead.")
  (parameters m))

(cl:ensure-generic-function 'contexts-val :lambda-list '(m))
(cl:defmethod contexts-val ((m <DialogflowResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dialogflow_ros_msgs-msg:contexts-val is deprecated.  Use dialogflow_ros_msgs-msg:contexts instead.")
  (contexts m))

(cl:ensure-generic-function 'intent-val :lambda-list '(m))
(cl:defmethod intent-val ((m <DialogflowResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dialogflow_ros_msgs-msg:intent-val is deprecated.  Use dialogflow_ros_msgs-msg:intent instead.")
  (intent m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DialogflowResult>) ostream)
  "Serializes a message object of type '<DialogflowResult>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'action))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'action))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'query_text))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'query_text))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'fulfillment_text))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'fulfillment_text))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'parameters))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'parameters))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'contexts))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'contexts))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'intent))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'intent))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DialogflowResult>) istream)
  "Deserializes a message object of type '<DialogflowResult>"
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
      (cl:setf (cl:slot-value msg 'query_text) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'query_text) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'fulfillment_text) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'fulfillment_text) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'intent) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'intent) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DialogflowResult>)))
  "Returns string type for a message object of type '<DialogflowResult>"
  "dialogflow_ros_msgs/DialogflowResult")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DialogflowResult)))
  "Returns string type for a message object of type 'DialogflowResult"
  "dialogflow_ros_msgs/DialogflowResult")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DialogflowResult>)))
  "Returns md5sum for a message object of type '<DialogflowResult>"
  "7af2326075f5db031043836d68eb1ad3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DialogflowResult)))
  "Returns md5sum for a message object of type 'DialogflowResult"
  "7af2326075f5db031043836d68eb1ad3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DialogflowResult>)))
  "Returns full string definition for message of type '<DialogflowResult>"
  (cl:format cl:nil "string action~%string query_text~%string fulfillment_text~%DialogflowParameter[] parameters~%DialogflowContext[] contexts~%string intent~%================================================================================~%MSG: dialogflow_ros_msgs/DialogflowParameter~%string param_name~%string[] value~%================================================================================~%MSG: dialogflow_ros_msgs/DialogflowContext~%string name~%int32 lifespan_count~%DialogflowParameter[] parameters~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DialogflowResult)))
  "Returns full string definition for message of type 'DialogflowResult"
  (cl:format cl:nil "string action~%string query_text~%string fulfillment_text~%DialogflowParameter[] parameters~%DialogflowContext[] contexts~%string intent~%================================================================================~%MSG: dialogflow_ros_msgs/DialogflowParameter~%string param_name~%string[] value~%================================================================================~%MSG: dialogflow_ros_msgs/DialogflowContext~%string name~%int32 lifespan_count~%DialogflowParameter[] parameters~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DialogflowResult>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'action))
     4 (cl:length (cl:slot-value msg 'query_text))
     4 (cl:length (cl:slot-value msg 'fulfillment_text))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'parameters) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'contexts) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:length (cl:slot-value msg 'intent))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DialogflowResult>))
  "Converts a ROS message object to a list"
  (cl:list 'DialogflowResult
    (cl:cons ':action (action msg))
    (cl:cons ':query_text (query_text msg))
    (cl:cons ':fulfillment_text (fulfillment_text msg))
    (cl:cons ':parameters (parameters msg))
    (cl:cons ':contexts (contexts msg))
    (cl:cons ':intent (intent msg))
))
