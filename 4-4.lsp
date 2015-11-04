(in-package :cs325-user)

(defun bst-elements (bst)
  (let ((lst nil))
    (bst-traverse #'(lambda (elt) (push elt lst)) bst)
    lst))

(defun bst-elements (bst)
  (if bst
      (append (bst-elements (node-r bst))
              (cons (node-elt bst)
                    (bst-elements (node-l bst))))
    nil))
