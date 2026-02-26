(defun check-admission (name marks entrance sports)
  (format t "~%Student: ~A~%" name)
  (format t "Goal: Admission~%")
  (let ((path1 (and (> marks 80) entrance))
        (path2 (and sports (> marks 60))))
    (format t "  Path 1: marks>80(~A) AND entrance(~A) => ~A~%"
            (> marks 80) entrance (if path1 "YES" "NO"))
    (format t "  Path 2: sports(~A) AND marks>60(~A) => ~A~%"
            sports (> marks 60) (if path2 "YES" "NO"))
    (if (or path1 path2)
        (format t "  Result: ADMITTED~%")
        (format t "  Result: NOT ADMITTED~%"))))

(check-admission "Alice" 85 t nil)
(check-admission "Bob" 65 nil t)
(check-admission "Charlie" 55 nil nil)
(check-admission "Diana" 70 nil t)
