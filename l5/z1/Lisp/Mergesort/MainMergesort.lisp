(defun mergesort (lst)
  "Sort a list using the merge sort algorithm."
  (if (or (null lst) (null (cdr lst)))
      lst
      (let* ((half (floor (/ (length lst) 2)))
             (left (subseq lst 0 half))
             (right (subseq lst half)))
        (merge-lists (mergesort left) (mergesort right)))))

(defun merge-lists (left right)
  "Merge two sorted lists into a single sorted list."
  (cond
    ((null left) right)
    ((null right) left)
    ((<= (car left) (car right))
     (cons (car left) (merge-lists (cdr left) right)))
    (t
     (cons (car right) (merge-lists left (cdr right))))))

(defun main-mergesort ()
  "Main function to demonstrate merge sort."
  (let ((list '(4 3 1 5 2)))
    (format t "Merge Sort: ~a~%" (mergesort list))))
