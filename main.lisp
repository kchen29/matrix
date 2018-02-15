(eval-when (:compile-toplevel :load-toplevel)
  (load "draw"))

(defun main (a-size filename)
  "Tests matrix multiplication, making an A-SIZE by A-SIZE image. Outputs to FILENAME."
  (let* ((dimensions (list a-size a-size))
         (screen (make-array dimensions :initial-element '(0 0 0)))
         (edge-list (make-matrix 4 0))
         (transform (make-matrix)))
    (print-matrix transform)
    (ident transform)
    (print-matrix transform)
    
    (add-edge edge-list 0 0 0 499 499 0)
    (print-matrix edge-list)
    (draw-lines edge-list screen '(255 0 0))
    (write-ppm filename dimensions screen)))

(main 500 "output.ppm")
