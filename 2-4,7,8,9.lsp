(in-package :cs325-user)


; 2-4
(defun greater (a b)
  (if (< a b) b a))

; 2-7
(defun has-list-p (ls)
  (if (null ls)
      nil
    (or (listp (car ls))
        (has-list-p (cdr ls)))))

; 2-8 a iteration
(defun print-dots (p-number)
  (do ((i 0 (+ i 1)))
      ((>= i p-number) 'done)
    (format t ".")))

; 2-8 a recursion
(defun print-dots (p-number)
  (if (= 0 p-number)
      'done
    (progn (format t ".")
      (print-dots (- p-number 1)))))

; 2-8 b iteration
(defun get-a-count (ls)
  (let ((count 0))
    (dolist (obj ls)
      (and (equal obj 'a)
           (setf count (+ count 1))))
    count))

; 2-8 b recursion
(defun get-a-count (ls)
  (if (null ls)
      0
    (if (equal (car ls) 'a)
        (+ get-a-count (cdr ls)) 1)
    (get-a-count (cdr ls))))

; 9 a
(defun summit (1st)
  (apply #'+ (remove nil 1st)))

; 9 b
(defun summit (1st)
  (if 1st
      (let ((x (car 1st)))
        (if (null x)
            (summit (cdr 1st))
          (+ x (summit (cdr 1st)))))
    0))