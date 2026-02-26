(format t "Enter basic salary: ")
(finish-output)
(setq basic (read))

(cond ((<= basic 10000) (setq hra (* 0.20 basic)) (setq da (* 0.90 basic)))
      ((<= basic 20000) (setq hra (* 0.25 basic)) (setq da (* 0.90 basic)))
      (t                (setq hra (* 0.30 basic)) (setq da (* 0.95 basic))))

(setq gross (+ basic hra da))

(format t "Basic: ~A~%" basic)
(format t "HRA: ~,2F~%" hra)
(format t "DA: ~,2F~%" da)
(format t "Gross Salary: ~,2F~%" gross)
