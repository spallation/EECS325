(defstruct 3tree data left middle right)

(defun 3tree-clone (tree)
  (if (3tree-p tree)
      (make-3tree :data (3tree-data tree)
                  :left (3tree-clone (3tree-left tree))
                  :middle (3tree-clone (3tree-middle tree))
                  :right (3tree-clone (3tree-right tree)))
    nil))

(defun 3tree-member (obj tree)
  (cond ((not (3tree-p tree)) nil)
        ((eql obj (3tree-data tree)) t)
        (t (or (3tree-member obj (3tree-left tree))
               (3tree-member obj (3tree-middle tree))
               (3tree-member obj (3tree-right tree))))))
            
