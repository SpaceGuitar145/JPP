(defun binomial (n k)
  (if (or (= k 0) (= k n))
      1
      (+ (binomial (- n 1) (- k 1)) (binomial (- n 1) k))))

(defun main-binomial ()
  (let ((n 5)
        (k 2))
    (format t "Binomial Coefficient (~d, ~d): ~d~%" n k (binomial n k))))
