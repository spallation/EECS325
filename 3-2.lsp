(defun stable-union (ls1 ls2)
  (append ls1 (stable-set-difference ls2 ls1)))

(defun stable-intersection (ls1 ls2)
  (do ((l1 ls1 (cdr l1))
       (l nil (if (member (car l1) ls2) (cons (car l1) l) l)))
      ((null l1) (reverse l))))

(defun stable-set-difference (ls1 ls2)
  (do ((l1 ls1 (cdr l1))
       (l nil (if (member (car l1) ls2) l (cons (car l1) l))))
      ((null l1) (reverse l))))