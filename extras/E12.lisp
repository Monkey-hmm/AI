(setq facts '(raining cloudy))
(setq rules '((wet-ground (raining))
              (take-umbrella (raining going-out))
              (stay-home (cloudy cold))
              (going-out (sunny))
              (cold (winter))))

(defun known-p (fact) (member fact facts))

(defun apply-rules ()
  (setq changed t)
  (loop while changed do
    (setq changed nil)
    (dolist (rule rules)
      (setq conclusion (first rule))
      (setq conditions (second rule))
      (when (not (known-p conclusion))
        (setq all-met t)
        (dolist (c conditions)
          (when (not (known-p c)) (setq all-met nil)))
        (when all-met
          (push conclusion facts)
          (format t "Derived: ~A (from ~A)~%" conclusion conditions)
          (setq changed t))))))

(format t "Initial facts: ~A~%~%" facts)
(apply-rules)
(format t "~%Final facts: ~A~%" facts)
