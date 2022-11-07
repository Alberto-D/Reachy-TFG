
(cl:in-package :asdf)

(defsystem "dialogflow_ros_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "DialogflowContext" :depends-on ("_package_DialogflowContext"))
    (:file "_package_DialogflowContext" :depends-on ("_package"))
    (:file "DialogflowEvent" :depends-on ("_package_DialogflowEvent"))
    (:file "_package_DialogflowEvent" :depends-on ("_package"))
    (:file "DialogflowParameter" :depends-on ("_package_DialogflowParameter"))
    (:file "_package_DialogflowParameter" :depends-on ("_package"))
    (:file "DialogflowRequest" :depends-on ("_package_DialogflowRequest"))
    (:file "_package_DialogflowRequest" :depends-on ("_package"))
    (:file "DialogflowResult" :depends-on ("_package_DialogflowResult"))
    (:file "_package_DialogflowResult" :depends-on ("_package"))
  ))