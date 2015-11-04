(in-package :cs325-user)

(defun map-range (fn start end)
  (do ((incr (if (< start end) 1 -1))
       (i start (+ i incr))
       (lst nil (cons (funcall fn i) lst)))
      ((= i end) (nreverse lst))))

(defun find-range (fn start end)
  (do ((incr (if (< start end) 1 -1))
       (i start (+ i incr)))
      ((or (= i end) (funcall fn i))
       (if (= i end) nil i))))

(defun every-range (fn start end)
  (do ((incr (if (< start end) 1 -1))
       (i start (+ i incr)))
      ((or (= i end) (null (funcall fn i)))
       (= i end))))
