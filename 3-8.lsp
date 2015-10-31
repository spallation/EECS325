(defun show-dots (l)
  (cond ((atom l) (format t "~A" l))
        (t 
         (format t "(")
         (show-dots (car l))
         (format t " . ")
         (show-dots (cdr l))
         (format t ")"))))

(defun show-list (l)
  (cond ((atom l) (format t "~A" l))
        (t 
         (format t "[")
         (show-list (car l))
         (do ((lst (cdr l) (cdr lst)))
             ((atom lst) (unless (null lst) (format t " . ~A" lst)))
           (format t " ")
           (show-list (car lst)))
         (format t "]"))))
