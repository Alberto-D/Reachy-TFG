;; Auto-generated. Do not edit!


(when (boundp 'usb_cam::MotorMsg)
  (if (not (find-package "USB_CAM"))
    (make-package "USB_CAM"))
  (shadow 'MotorMsg (find-package "USB_CAM")))
(unless (find-package "USB_CAM::MOTORMSG")
  (make-package "USB_CAM::MOTORMSG"))

(in-package "ROS")
;;//! \htmlinclude MotorMsg.msg.html


(defclass usb_cam::MotorMsg
  :super ros::object
  :slots (_x_sector _y_sector _x _y _motor_action ))

(defmethod usb_cam::MotorMsg
  (:init
   (&key
    ((:x_sector __x_sector) 0)
    ((:y_sector __y_sector) 0)
    ((:x __x) 0)
    ((:y __y) 0)
    ((:motor_action __motor_action) "")
    )
   (send-super :init)
   (setq _x_sector (round __x_sector))
   (setq _y_sector (round __y_sector))
   (setq _x (round __x))
   (setq _y (round __y))
   (setq _motor_action (string __motor_action))
   self)
  (:x_sector
   (&optional __x_sector)
   (if __x_sector (setq _x_sector __x_sector)) _x_sector)
  (:y_sector
   (&optional __y_sector)
   (if __y_sector (setq _y_sector __y_sector)) _y_sector)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:motor_action
   (&optional __motor_action)
   (if __motor_action (setq _motor_action __motor_action)) _motor_action)
  (:serialization-length
   ()
   (+
    ;; int64 _x_sector
    8
    ;; int64 _y_sector
    8
    ;; int64 _x
    8
    ;; int64 _y
    8
    ;; string _motor_action
    4 (length _motor_action)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _x_sector
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _x_sector (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _x_sector) (= (length (_x_sector . bv)) 2)) ;; bignum
              (write-long (ash (elt (_x_sector . bv) 0) 0) s)
              (write-long (ash (elt (_x_sector . bv) 1) -1) s))
             ((and (class _x_sector) (= (length (_x_sector . bv)) 1)) ;; big1
              (write-long (elt (_x_sector . bv) 0) s)
              (write-long (if (>= _x_sector 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _x_sector s)(write-long (if (>= _x_sector 0) 0 #xffffffff) s)))
     ;; int64 _y_sector
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _y_sector (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _y_sector) (= (length (_y_sector . bv)) 2)) ;; bignum
              (write-long (ash (elt (_y_sector . bv) 0) 0) s)
              (write-long (ash (elt (_y_sector . bv) 1) -1) s))
             ((and (class _y_sector) (= (length (_y_sector . bv)) 1)) ;; big1
              (write-long (elt (_y_sector . bv) 0) s)
              (write-long (if (>= _y_sector 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _y_sector s)(write-long (if (>= _y_sector 0) 0 #xffffffff) s)))
     ;; int64 _x
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _x (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _x) (= (length (_x . bv)) 2)) ;; bignum
              (write-long (ash (elt (_x . bv) 0) 0) s)
              (write-long (ash (elt (_x . bv) 1) -1) s))
             ((and (class _x) (= (length (_x . bv)) 1)) ;; big1
              (write-long (elt (_x . bv) 0) s)
              (write-long (if (>= _x 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _x s)(write-long (if (>= _x 0) 0 #xffffffff) s)))
     ;; int64 _y
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _y (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _y) (= (length (_y . bv)) 2)) ;; bignum
              (write-long (ash (elt (_y . bv) 0) 0) s)
              (write-long (ash (elt (_y . bv) 1) -1) s))
             ((and (class _y) (= (length (_y . bv)) 1)) ;; big1
              (write-long (elt (_y . bv) 0) s)
              (write-long (if (>= _y 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _y s)(write-long (if (>= _y 0) 0 #xffffffff) s)))
     ;; string _motor_action
       (write-long (length _motor_action) s) (princ _motor_action s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _x_sector
#+(or :alpha :irix6 :x86_64)
      (setf _x_sector (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _x_sector (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _y_sector
#+(or :alpha :irix6 :x86_64)
      (setf _y_sector (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _y_sector (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _x
#+(or :alpha :irix6 :x86_64)
      (setf _x (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _x (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _y
#+(or :alpha :irix6 :x86_64)
      (setf _y (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _y (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; string _motor_action
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _motor_action (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get usb_cam::MotorMsg :md5sum-) "d31343a4c82aa80a88c6a541c909111d")
(setf (get usb_cam::MotorMsg :datatype-) "usb_cam/MotorMsg")
(setf (get usb_cam::MotorMsg :definition-)
      "int64 x_sector
int64 y_sector
int64 x
int64 y
string motor_action

")



(provide :usb_cam/MotorMsg "d31343a4c82aa80a88c6a541c909111d")


