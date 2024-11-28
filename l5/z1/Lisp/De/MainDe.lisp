(defun extended-gcd (a b)
  (if (= a 0)
      (values b 0 1)
      (multiple-value-bind (g x y) (extended-gcd (mod b a) a)
        (values g (- y (* (floor b a) x)) x))))

(defun de (a b)
  (extended-gcd a b))

(defun main-de ()
  (let ((a 4)
        (b 6)
        (c 14))
    (multiple-value-bind (g x y) (de a b)
      (if (/= (mod c g) 0)
          (format t "No solution~%")
          (let ((k (/ c g)))
            (format t "Diophantine solution (~dx + ~dy = ~d): (~d, ~d)~%" a b c (* x k) (* y k)))))))