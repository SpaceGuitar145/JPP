(defun pascal-triangle (n)
  (if (= n 0)
      (list (list 1))
      (let ((previous (pascal-triangle (- n 1))))
        (append previous
                (list (cons 1
                            (append (mapcar #'+ (butlast (car (last previous))) 
                                            (cdr (car (last previous)))) 
                                    (list 1))))))))

(defun binomial2 (n k)
  (nth k (nth n (pascal-triangle n))))

(defun main-binomial2 ()
  (let ((n 5)
        (k 2))
    (format t "Binomial2 Coefficient (~d, ~d): ~d~%" n k (binomial2 n k))))