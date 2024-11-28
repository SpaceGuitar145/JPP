(defun sieve (lst)
  (if (null lst)
      nil
      (let ((x (car lst)))
        (cons x (sieve (remove-if (lambda (y) (= (mod y x) 0)) (cdr lst)))))))

(defun primes (n)
  (sieve (number-sequence 2 n)))

(defun number-sequence (start end)
  (if (> start end)
      nil
      (cons start (number-sequence (+ start 1) end))))

(defun main-primes ()
  (let ((n 30))
    (format t "Primes between 2 and ~d: ~a~%" n (primes n))))
