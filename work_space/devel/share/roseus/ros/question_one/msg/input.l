;; Auto-generated. Do not edit!


(when (boundp 'question_one::input)
  (if (not (find-package "QUESTION_ONE"))
    (make-package "QUESTION_ONE"))
  (shadow 'input (find-package "QUESTION_ONE")))
(unless (find-package "QUESTION_ONE::INPUT")
  (make-package "QUESTION_ONE::INPUT"))

(in-package "ROS")
;;//! \htmlinclude input.msg.html


(defclass question_one::input
  :super ros::object
  :slots (_vector _angles _d ))

(defmethod question_one::input
  (:init
   (&key
    ((:vector __vector) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:angles __angles) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:d __d) 0.0)
    )
   (send-super :init)
   (setq _vector __vector)
   (setq _angles __angles)
   (setq _d (float __d))
   self)
  (:vector
   (&optional __vector)
   (if __vector (setq _vector __vector)) _vector)
  (:angles
   (&optional __angles)
   (if __angles (setq _angles __angles)) _angles)
  (:d
   (&optional __d)
   (if __d (setq _d __d)) _d)
  (:serialization-length
   ()
   (+
    ;; float64[3] _vector
    (* 8    3)
    ;; float64[3] _angles
    (* 8    3)
    ;; float64 _d
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[3] _vector
     (dotimes (i 3)
       (sys::poke (elt _vector i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[3] _angles
     (dotimes (i 3)
       (sys::poke (elt _angles i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64 _d
       (sys::poke _d (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[3] _vector
   (dotimes (i (length _vector))
     (setf (elt _vector i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[3] _angles
   (dotimes (i (length _angles))
     (setf (elt _angles i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64 _d
     (setq _d (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get question_one::input :md5sum-) "b13874c5ea905eae4aac5b1fd6887b8e")
(setf (get question_one::input :datatype-) "question_one/input")
(setf (get question_one::input :definition-)
      "float64[3] vector
float64[3] angles
float64 d

")



(provide :question_one/input "b13874c5ea905eae4aac5b1fd6887b8e")


