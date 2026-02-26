(defun negate (lit)
  (if (and (listp lit) (eq (car lit) 'not))
      (second lit)
      (list 'not lit)))

(defun try-resolve (c1 c2)
  (dolist (lit c1)
    (when (member (negate lit) c2 :test #'equal)
      (let ((result (append (remove lit c1 :test #'equal)
                            (remove (negate lit) c2 :test #'equal))))
        (return-from try-resolve (values result t)))))
  (values nil nil))

(defun prove (clauses goal)
  (format t "Clauses:~%")
  (dolist (c clauses) (format t "  ~A~%" c))
  (format t "Goal: ~A~%~%" goal)
  (push (list (negate goal)) clauses)
  (let ((done nil))
    (loop for i from 0 below (length clauses)
          while (not done) do
          (loop for j from (1+ i) below (length clauses)
                while (not done) do
                (multiple-value-bind (result found)
                    (try-resolve (nth i clauses) (nth j clauses))
                  (when found
                    (format t "~A + ~A => ~A~%"
                            (nth i clauses) (nth j clauses)
                            (if result result "EMPTY"))
                    (if (null result)
                        (progn (format t "~%PROVEN: ~A~%" goal)
                               (setq done t))
                        (unless (member result clauses :test #'equal)
                          (setf clauses (append clauses (list result)))))))))))

(prove '(((not p) q)
          (p)
          ((not q) r))
        'r)
