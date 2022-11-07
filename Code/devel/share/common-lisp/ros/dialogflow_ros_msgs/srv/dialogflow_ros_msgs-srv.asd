
(cl:in-package :asdf)

(defsystem "dialogflow_ros_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :dialogflow_ros_msgs-msg
)
  :components ((:file "_package")
    (:file "DialogflowService" :depends-on ("_package_DialogflowService"))
    (:file "_package_DialogflowService" :depends-on ("_package"))
  ))