(defun print-matrix (matrix)
  "Prints out MATRIX to *standard-out*"
  (format t "~{~%~{~a ~}~}" (matrix-to-list matrix)))

(defun matrix-to-list (matrix)
  "Turns MATRIX into a list"
  (loop for x below (array-dimension matrix 0)
     collect (loop for y below (array-dimension matrix 1)
                collect (aref matrix x y))))
                        
(defun ident (matrix)
  "Turns MATRIX into an identity matrix"
  (dotimes (x (array-dimension matrix 0))
    (dotimes (y (array-dimension matrix 1))
      (if (= x y)
          (setf (aref matrix x y) 1)
          (setf (aref matrix x y) 0)))))

(defun matrix-mult (m1 m2)
  "Multiplies M1 with M2. Does not modify either (for now?)")

(defun make-matrix (&optional (rows 4) (cols 4))
  (make-array (list rows cols) :adjustable t))
