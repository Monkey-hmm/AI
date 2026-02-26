(defun factorial (n)
  (if (<= n 1) 1 (* n (factorial (1- n)))))

(defun fibonacci (n)
  (cond ((<= n 0) 0)
        ((= n 1) 1)
        (t (+ (fibonacci (- n 1)) (fibonacci (- n 2))))))

(format t "Factorial of 5: ~A~%" (factorial 5))
(format t "Factorial of 10: ~A~%" (factorial 10))
(format t "~%Fibonacci sequence (0-10):~%")
(dotimes (i 11)
  (format t "fib(~A) = ~A~%" i (fibonacci i)))
