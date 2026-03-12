(setq clauses
 '((not power machine-fault)
   (power)
   (not machine-fault))) ; negated goal

(defun complement (a b)
  (or (equal a `(not ,b))
      (equal b `(not ,a))))

(defun resolve (c1 c2)

  (loop for x in c1 do
        (loop for y in c2 do
              (when (complement x y)

                (return-from resolve
                  (remove-duplicates
                   (append (remove x c1)
                           (remove y c2))
                   :test #'equal)))))

  nil)

(defun resolution (clauses)

  (loop for c1 in clauses do
        (loop for c2 in clauses do

              (let ((res (resolve c1 c2)))

                (when res
                  (format t "Resolve ~A & ~A → ~A~%" c1 c2 res)

                  (when (null res)
                    (format t "~%Empty clause found. Goal proven.~%")
                    (return-from resolution t))))))

  (format t "Goal not proven.~%"))

(resolution clauses)