(setq names '("Alice" "Bob" "Charlie" "Diana" "Eve"
              "Frank" "Grace" "Hank" "Ivy" "Jack"))

(setq assignments '((18 15 17 16 19)
                    (12 14 13 15 11)
                    (20 19 18 20 17)
                    (10 12 11 9 13)
                    (16 17 15 18 16)
                    (14 13 12 15 14)
                    (19 20 18 17 19)
                    (8 9 10 7 11)
                    (17 16 18 15 17)
                    (11 10 12 13 14)))

(setq finals '(45 30 48 25 40 35 47 20 42 28))

(defun total-grade (asgn final)
  (+ (* 0.5 (/ (* (apply #'+ asgn) 100) 100.0))
     (* 0.5 (* (/ final 50.0) 100))))

(defun letter-grade (g)
  (cond ((>= g 80) "A")
        ((>= g 60) "B")
        ((>= g 40) "C")
        (t "F")))

(setq grades nil)
(dotimes (i 10)
  (push (total-grade (nth i assignments) (nth i finals)) grades))
(setq grades (reverse grades))

(format t "~%~20A ~8A ~6A~%" "Student" "Grade" "Letter")
(dotimes (i 10)
  (format t "~20A ~8,2F ~6A~%"
          (nth i names) (nth i grades) (letter-grade (nth i grades))))

(format t "~%Average: ~,2F~%" (/ (apply #'+ grades) 10.0))
(format t "Highest: ~,2F~%" (apply #'max grades))
(format t "Lowest: ~,2F~%" (apply #'min grades))
