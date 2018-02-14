(defun print-matrix (matrix)
  "Prints out MATRIX to *standard-out*"
  (format t "~{~%~{~a ~}~})" (matrix-to-list matrix)))

(defun matrix-to-list (matrix)
  "Turns MATRIX into a list"
  (loop for x below (array-dimension matrix 0)
     collect (loop for y below (array-dimension matrix 1)
                collect (aref matrix x y))))
                        
(defun ident (matrix)
  "Turns MATRIX into an identity matrix")

(defun matrix-mult (m1 m2)
  "Multiplies M1 with M2. Does not modify either (for now?)")
