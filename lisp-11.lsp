(defun map-range (fn start end)
  (if (> start end)
      (do ((i (1+ end) (1+ i))
           (lst nil (cons (funcall fn i) lst)))
          ((> i start) lst))
  (do ((i (1- end) (1- i))
       (lst nil (cons (funcall fn i) lst)))
      ((< i start) lst))))

(defun find-range (fn start end)
  (if (> start end)
      (do ((i start (1- i))
           (result nil (if (null (funcall fn i)) nil i)))
          ((or (= i end) (not (null result))) result))
    (do ((i start (1+ i))
         (result nil (if (null (funcall fn i)) nil i)))
        ((or (= i end) (not (null result))) result))))

(defun every-range (fn start end)
  (if (> start end)
      (do ((i (1+ end) (1+ i))
           (valid-so-far t (funcall fn i))) 
          ((or (> i start) (null valid-so-far)) valid-so-far))
    (do ((i (1- end) (1- i))
         (valid-so-far t (funcall fn i))) 
        ((or (< i start) (null valid-so-far)) valid-so-far))))
; No need for two loops. Instead of choosing between functions 1+ and 1-, just calculate the appropriate 
; increment to add. You only need to do it once at the start. No LET needed to hold the result. 
; DO can initialize a variable that is unchanged for the rest of the loop.
