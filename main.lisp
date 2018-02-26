(defun main-test ()
  "Tests matrix stuff."
  (let ((edge-list (make-matrix 4 0))
        (transform (make-matrix)))
    (format t "transform matrix:")
    (print-matrix transform)

    (format t "turn transform matrix into identity:")
    (to-identity transform)
    (print-matrix transform)

    (format t "add an edge to the edge matrix")
    (add-edge edge-list 0 250 0 499 0 0)
    (print-matrix edge-list)
    
    (format t "multiply the edge matrix with the transform matrix")
    (setf edge-list (matrix-multiply transform edge-list))
    (print-matrix edge-list)
    
    (format t "turn the transform matrix into a nontrivial transform matrix:")
    (rotatef (aref transform 0 0) (aref transform 1 0) (aref transform 1 1) (aref transform 0 1))
    (print-matrix transform)

    (format t "apply the transform to the edge list")
    (setf edge-list (matrix-multiply transform edge-list))
    (print-matrix edge-list)))


(defun draw-transform-draw (transform edge-list screen color)
  (draw-lines edge-list screen color)
  (setf edge-list (matrix-multiply transform edge-list))
  (draw-lines edge-list screen color))

(defmacro add-edges (matrix edges)
  "Add multiple edges to the matrix."
  `(progn ,@(loop for edge in edges
               collect `(add-edge ,matrix
                                  ,(first edge) ,(second edge) 0
                                  ,(third edge) ,(fourth edge) 0))))

(defmacro clear-add-draw (matrix edges screen color)
  "Clear the matrix, add edges, then draw with the color"
  `(progn (clear-matrix ,matrix)
          (add-edges ,matrix ,edges)
          (draw-lines ,matrix ,screen ,color)))
  
(defun main (a-size filename)
  "Make fancy image, making an A-SIZE by A-SIZE image. Outputs to FILENAME."
  (let* ((dimensions (list a-size a-size))
         (half (/ a-size 2))
         (full (1- a-size))
         (screen (make-array dimensions :initial-element '(0 0 0)))
         (edges (make-matrix 4 0))
         (transform (make-matrix)))
    ;;make transform rotate 22.5 degrees from the point (250, 250)
    ;;have it be identity now
    (to-identity transform)

    (clear-add-draw edges ((0 0 full full)
                           (0 0 full half)
                           (full full 0 half))
                    screen '(0 255 0))

    (clear-add-draw edges ((0 full full 0)
                           (0 full full half)
                           (full 0 0 half))
                    screen '(0 255 255))

    (clear-add-draw edges ((0 0 half full)
                           (full full half 0))
                    screen '(255 0 0))

    (clear-add-draw edges ((0 full half 0)
                           (full 0 half full))
                    screen '(255 0 255))

    (clear-add-draw edges ((0 half full half)
                           (half 0 half full))
                    screen '(255 255 0))
    
    (write-ppm filename dimensions screen)
    (display filename)))

;(main-test)
;(main 500 "output.ppm")

