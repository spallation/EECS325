(defun rotate-array (array)
  (let ((dimensions (array-dimensions array)))
ARRAY-DIMENSION would be simpler than using ARRAY-DIMENSIONS in this context.
    (let ((n (car dimensions))
          (rotated-array (make-array dimensions)))
      (dotimes (i n rotated-array)
        (dotimes (j n t)
          (setf (aref rotated-array j (- (1- n) i)) (aref array i j)))))))
OK

(defun nrotate-array (array)
  (let ((max-index (1- (car (array-dimensions array)))))
ARRAY-DIMENSION would be simpler than using ARRAY-DIMENSIONS in this context.
    (dotimes (i max-index array)
      (dotimes (j (- max-index i) t)
        (unless (< j i)
A simpler way to handle the odd/even cases is to just always call FLOOR in one dimension and CEILING in the other. This lets you use a simpler nested DOTIMES.
          (rotatef (aref array (- max-index j) i)
                   (aref array (- max-index i) (- max-index j))
                   (aref array j (- max-index i))
                   (aref array i j)))))))
As noted on the exercises page: "A number of old exercises are not in any bundle. While you are not forbidden from doing them, focus on the ones in bundles for now." Repeated submission of non-bundled exercises will count for less than bundled ones.
Otherwise, OK. Don't resubmit.
