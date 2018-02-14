(eval-when (:compile-toplevel :load-toplevel)
  (load "draw"))

(defun main (a-size filename)
  "Tests matrix multiplication, making an A-SIZE by A-SIZE image. Outputs to FILENAME.")

(main 500 "output.ppm")
