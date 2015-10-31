(defun bst-elements (bst)
  (if (null bst)
      nil
    (let ((max-element (node-elt (bst-max bst))))
      (let ((bst (bst-remove max-element bst #'<)))
        (cons max-element (bst-elements bst))))))
; Calling bst-remove repeatedly is very expensive because bst-remove makes a copy of the entire tree.
; This exercise asks for two solutions. Check the web page.
