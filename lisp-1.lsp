(defun has-number-p (s-exp)
  (if (consp s-exp)
      (some #'(lambda (x) (has-number-p x)) s-exp)
  (numberp s-exp)))

