(defun position+ (ls &optional (ith 0))
  (and (not (null ls))
      (cons (+ ith (car ls)) (position+ (cdr ls) (1+ ith)))))

(defun position+ (ls)
  (do ((ith 0 (1+ ith))
       (lst ls (rest lst))
       (l nil (cons (+ (car lst) ith) l)))
      ((null lst) (reverse l))))

(defun position+ (ls)
  (let ((ith -1))
    (mapcar #'(lambda (x) (+ x (incf ith))) ls)))
    
