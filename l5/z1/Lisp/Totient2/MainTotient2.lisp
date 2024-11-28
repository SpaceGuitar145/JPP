(defun totient2 (n)
  (let ((factors (unique (prime-factors n))))
    (round (* n (reduce #'* (mapcar (lambda (p) (- 1 (/ 1 p))) factors))))))

(defun main-totient2 ()
  (let ((n 9))
    (format t "Totient2 of ~d: ~d~%" n (totient2 n))))