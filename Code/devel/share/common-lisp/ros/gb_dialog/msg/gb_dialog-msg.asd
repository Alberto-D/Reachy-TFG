
(cl:in-package :asdf)

(defsystem "gb_dialog-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ActionMsg" :depends-on ("_package_ActionMsg"))
    (:file "_package_ActionMsg" :depends-on ("_package"))
  ))