(defun eval-prop (expr vals)
  (cond
    ((eq expr t) t)
    ((eq expr nil) nil)
    ((symbolp expr) (cdr (assoc expr vals)))
    ((eq (first expr) 'not) (not (eval-prop (second expr) vals)))
    ((eq (first expr) 'and) (and (eval-prop (second expr) vals)
                                  (eval-prop (third expr) vals)))
    ((eq (first expr) 'or)  (or  (eval-prop (second expr) vals)
                                  (eval-prop (third expr) vals)))
    (t nil)))

(setq vals '((p . t) (q . nil) (r . t)))
(format t "Values: ~A~%~%" vals)

(setq e1 '(and p r))
(format t "~A => ~A~%" e1 (eval-prop e1 vals))

(setq e2 '(or q r))
(format t "~A => ~A~%" e2 (eval-prop e2 vals))

(setq e3 '(not q))
(format t "~A => ~A~%" e3 (eval-prop e3 vals))

(setq e4 '(and (or p q) (not q)))
(format t "~A => ~A~%" e4 (eval-prop e4 vals))
