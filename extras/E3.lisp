(format t "Enter first number: ")
(finish-output)
(setq a (read))
(format t "Enter operator (+, -, *, /): ")
(finish-output)
(setq op (read))
(format t "Enter second number: ")
(finish-output)
(setq b (read))

(setq result
  (cond ((equal op '+) (+ a b))
        ((equal op '-) (- a b))
        ((equal op '*) (* a b))
        ((equal op '/) (if (zerop b) "Error: divide by zero" (float (/ a b))))
        (t "Unknown operator")))

(format t "~A ~A ~A = ~A~%" a op b result)
