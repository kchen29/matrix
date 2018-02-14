(eval-when (:compile-toplevel :load-toplevel)
  (load "draw"))

(defun main (a-size filename)
  "Tests matrix multiplication, making an A-SIZE by A-SIZE image. Outputs to FILENAME."
  (let ((matrix (make-matrix 4 4)))
    (print-matrix matrix)
    (ident matrix)
    (print-matrix matrix)
    (add-point matrix 3 4)))

(main 500 "output.ppm")
