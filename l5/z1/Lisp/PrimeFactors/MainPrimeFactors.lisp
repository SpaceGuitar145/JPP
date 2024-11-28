(defun unique (lst)
  (remove-duplicates lst :test #'equal))

(defun prime-factors (n)
  (labels ((factorize (n divisor)
             (cond ((= n 1) nil)
                   ((= (mod n divisor) 0) (cons divisor (factorize (/ n divisor) divisor)))
                   (t (factorize n (+ divisor 1))))))
    (factorize n 2))) 

(defun main-prime-factors ()
  (let ((n 60))
    (format t "Prime Factors of ~d: ~a~%" n (unique (prime-factors n))))) 