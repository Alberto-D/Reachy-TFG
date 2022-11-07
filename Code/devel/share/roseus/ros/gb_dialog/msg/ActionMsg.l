;; Auto-generated. Do not edit!


(when (boundp 'gb_dialog::ActionMsg)
  (if (not (find-package "GB_DIALOG"))
    (make-package "GB_DIALOG"))
  (shadow 'ActionMsg (find-package "GB_DIALOG")))
(unless (find-package "GB_DIALOG::ACTIONMSG")
  (make-package "GB_DIALOG::ACTIONMSG"))

(in-package "ROS")
;;//! \htmlinclude ActionMsg.msg.html


(defclass gb_dialog::ActionMsg
  :super ros::object
  :slots (_mode _action _data ))

(defmethod gb_dialog::ActionMsg
  (:init
   (&key
    ((:mode __mode) 0)
    ((:action __action) "")
    ((:data __data) "")
    )
   (send-super :init)
   (setq _mode (round __mode))
   (setq _action (string __action))
   (setq _data (string __data))
   self)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:action
   (&optional __action)
   (if __action (setq _action __action)) _action)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; int64 _mode
    8
    ;; string _action
    4 (length _action)
    ;; string _data
    4 (length _data)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _mode
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _mode (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _mode) (= (length (_mode . bv)) 2)) ;; bignum
              (write-long (ash (elt (_mode . bv) 0) 0) s)
              (write-long (ash (elt (_mode . bv) 1) -1) s))
             ((and (class _mode) (= (length (_mode . bv)) 1)) ;; big1
              (write-long (elt (_mode . bv) 0) s)
              (write-long (if (>= _mode 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _mode s)(write-long (if (>= _mode 0) 0 #xffffffff) s)))
     ;; string _action
       (write-long (length _action) s) (princ _action s)
     ;; string _data
       (write-long (length _data) s) (princ _data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _mode
#+(or :alpha :irix6 :x86_64)
      (setf _mode (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _mode (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; string _action
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _action (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _data
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _data (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get gb_dialog::ActionMsg :md5sum-) "d5e5c8f51b53e657059a1ed6ff38544d")
(setf (get gb_dialog::ActionMsg :datatype-) "gb_dialog/ActionMsg")
(setf (get gb_dialog::ActionMsg :definition-)
      "int64 mode
string action
string data

")



(provide :gb_dialog/ActionMsg "d5e5c8f51b53e657059a1ed6ff38544d")


