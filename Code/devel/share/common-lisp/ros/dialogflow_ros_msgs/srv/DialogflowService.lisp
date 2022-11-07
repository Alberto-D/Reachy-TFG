; Auto-generated. Do not edit!


(cl:in-package dialogflow_ros_msgs-srv)


;//! \htmlinclude DialogflowService-request.msg.html

(cl:defclass <DialogflowService-request> (roslisp-msg-protocol:ros-message)
  ((voice
    :reader voice
    :initarg :voice
    :type cl:boolean
    :initform cl:nil)
   (text
    :reader text
    :initarg :text
    :type cl:string
    :initform ""))
)

(cl:defclass DialogflowService-request (<DialogflowService-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DialogflowService-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DialogflowService-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dialogflow_ros_msgs-srv:<DialogflowService-request> is deprecated: use dialogflow_ros_msgs-srv:DialogflowService-request instead.")))

(cl:ensure-generic-function 'voice-val :lambda-list '(m))
(cl:defmethod voice-val ((m <DialogflowService-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dialogflow_ros_msgs-srv:voice-val is deprecated.  Use dialogflow_ros_msgs-srv:voice instead.")
  (voice m))

(cl:ensure-generic-function 'text-val :lambda-list '(m))
(cl:defmethod text-val ((m <DialogflowService-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dialogflow_ros_msgs-srv:text-val is deprecated.  Use dialogflow_ros_msgs-srv:text instead.")
  (text m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DialogflowService-request>) ostream)
  "Serializes a message object of type '<DialogflowService-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'voice) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'text))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'text))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DialogflowService-request>) istream)
  "Deserializes a message object of type '<DialogflowService-request>"
    (cl:setf (cl:slot-value msg 'voice) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'text) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'text) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DialogflowService-request>)))
  "Returns string type for a service object of type '<DialogflowService-request>"
  "dialogflow_ros_msgs/DialogflowServiceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DialogflowService-request)))
  "Returns string type for a service object of type 'DialogflowService-request"
  "dialogflow_ros_msgs/DialogflowServiceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DialogflowService-request>)))
  "Returns md5sum for a message object of type '<DialogflowService-request>"
  "70029259094fc3123850886da266641c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DialogflowService-request)))
  "Returns md5sum for a message object of type 'DialogflowService-request"
  "70029259094fc3123850886da266641c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DialogflowService-request>)))
  "Returns full string definition for message of type '<DialogflowService-request>"
  (cl:format cl:nil "bool voice~%string text~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DialogflowService-request)))
  "Returns full string definition for message of type 'DialogflowService-request"
  (cl:format cl:nil "bool voice~%string text~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DialogflowService-request>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'text))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DialogflowService-request>))
  "Converts a ROS message object to a list"
  (cl:list 'DialogflowService-request
    (cl:cons ':voice (voice msg))
    (cl:cons ':text (text msg))
))
;//! \htmlinclude DialogflowService-response.msg.html

(cl:defclass <DialogflowService-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (result
    :reader result
    :initarg :result
    :type dialogflow_ros_msgs-msg:DialogflowResult
    :initform (cl:make-instance 'dialogflow_ros_msgs-msg:DialogflowResult)))
)

(cl:defclass DialogflowService-response (<DialogflowService-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DialogflowService-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DialogflowService-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dialogflow_ros_msgs-srv:<DialogflowService-response> is deprecated: use dialogflow_ros_msgs-srv:DialogflowService-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <DialogflowService-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dialogflow_ros_msgs-srv:success-val is deprecated.  Use dialogflow_ros_msgs-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <DialogflowService-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dialogflow_ros_msgs-srv:result-val is deprecated.  Use dialogflow_ros_msgs-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DialogflowService-response>) ostream)
  "Serializes a message object of type '<DialogflowService-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'result) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DialogflowService-response>) istream)
  "Deserializes a message object of type '<DialogflowService-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'result) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DialogflowService-response>)))
  "Returns string type for a service object of type '<DialogflowService-response>"
  "dialogflow_ros_msgs/DialogflowServiceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DialogflowService-response)))
  "Returns string type for a service object of type 'DialogflowService-response"
  "dialogflow_ros_msgs/DialogflowServiceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DialogflowService-response>)))
  "Returns md5sum for a message object of type '<DialogflowService-response>"
  "70029259094fc3123850886da266641c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DialogflowService-response)))
  "Returns md5sum for a message object of type 'DialogflowService-response"
  "70029259094fc3123850886da266641c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DialogflowService-response>)))
  "Returns full string definition for message of type '<DialogflowService-response>"
  (cl:format cl:nil "bool success~%DialogflowResult result~%~%================================================================================~%MSG: dialogflow_ros_msgs/DialogflowResult~%string action~%string query_text~%string fulfillment_text~%DialogflowParameter[] parameters~%DialogflowContext[] contexts~%string intent~%================================================================================~%MSG: dialogflow_ros_msgs/DialogflowParameter~%string param_name~%string[] value~%================================================================================~%MSG: dialogflow_ros_msgs/DialogflowContext~%string name~%int32 lifespan_count~%DialogflowParameter[] parameters~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DialogflowService-response)))
  "Returns full string definition for message of type 'DialogflowService-response"
  (cl:format cl:nil "bool success~%DialogflowResult result~%~%================================================================================~%MSG: dialogflow_ros_msgs/DialogflowResult~%string action~%string query_text~%string fulfillment_text~%DialogflowParameter[] parameters~%DialogflowContext[] contexts~%string intent~%================================================================================~%MSG: dialogflow_ros_msgs/DialogflowParameter~%string param_name~%string[] value~%================================================================================~%MSG: dialogflow_ros_msgs/DialogflowContext~%string name~%int32 lifespan_count~%DialogflowParameter[] parameters~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DialogflowService-response>))
  (cl:+ 0
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'result))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DialogflowService-response>))
  "Converts a ROS message object to a list"
  (cl:list 'DialogflowService-response
    (cl:cons ':success (success msg))
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'DialogflowService)))
  'DialogflowService-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'DialogflowService)))
  'DialogflowService-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DialogflowService)))
  "Returns string type for a service object of type '<DialogflowService>"
  "dialogflow_ros_msgs/DialogflowService")