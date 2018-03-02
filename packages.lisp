(defpackage :display
  (:use :cl :sb-ext)
  (:export
   #:write-ppm
   #:display))

(defpackage :draw
  (:use :cl :display)
  (:export
   #:plot
   #:draw-line
   #:draw-lines
   #:add-edge))

(defpackage :matrix
  (:use :cl :display :draw)
  (:export
   #:print-matrix
   #:to-identity
   #:matrix-multiply
   #:make-matrix
   #:clear-matrix))

(defpackage :main
  (:use :cl :display :draw :matrix))
