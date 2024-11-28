(defun totient (n)
  (length (remove-if-not (lambda (x) (= (gcd x n) 1))
                         (number-sequence 1 n))))

(defun number-sequence (start end)
  (if (> start end)
      nil
      (cons start (number-sequence (+ start 1) end))))

(defun main-totient ()
  (let ((n 9))
    (format t "Totient of ~d: ~d~%" n (totient n))))
