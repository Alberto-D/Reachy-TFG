
(cl:in-package :asdf)

(defsystem "usb_cam-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "MotorMsg" :depends-on ("_package_MotorMsg"))
    (:file "_package_MotorMsg" :depends-on ("_package"))
  ))