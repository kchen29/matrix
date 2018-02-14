(eval-when (:compile-toplevel :load-toplevel)
  (load "draw"))

(defun main (a-size filename)
  "Tests matrix multiplication, making an A-SIZE by A-SIZE image. Outputs to FILENAME."
  (let ((matrix (make-array '(4 4) :adjustable t :initial-element 3)))
    (print-matrix matrix)))

(main 500 "output.ppm")
