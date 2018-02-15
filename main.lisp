(eval-when (:compile-toplevel :load-toplevel)
  (load "draw"))

(defun main (a-size filename)
  "Tests matrix multiplication, making an A-SIZE by A-SIZE image. Outputs to FILENAME."
  (let* ((dimensions (list a-size a-size))
         (screen (make-array dimensions :initial-element '(0 0 0)))
         (edge-list (make-matrix 4 0))
         (transform (make-matrix)))
    (format t "transform matrix:")
    (print-matrix transform)

    (format t "turn transform matrix into identity:")
    (to-identity transform)
    (print-matrix transform)

    (format t "add an edge to the edge matrix")
    (add-edge edge-list 0 250 0 499 0 0)
    (print-matrix edge-list)
    (draw-lines edge-list screen '(255 0 0))
    
    (format t "multiply the edge matrix with the transform matrix")
    (setf edge-list (matrix-multiply transform edge-list))
    (print-matrix edge-list)
    
    (format t "turn the transform matrix into a nontrivial transform matrix:")
    (rotatef (aref transform 0 0) (aref transform 1 0) (aref transform 1 1) (aref transform 0 1))
    (print-matrix transform)

    (format t "apply the transform to the edge list")
    (setf edge-list (matrix-multiply transform edge-list))
    (print-matrix edge-list)
    (draw-lines edge-list screen '(255 0 0))
    
    (write-ppm filename dimensions screen)
    (display filename)))

(main 500 "output.ppm")
