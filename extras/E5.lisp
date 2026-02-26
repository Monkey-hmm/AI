(defun fire-alarm (smoke temp)
  (format t "Smoke: ~A, Temp: ~A~%" (if smoke "YES" "NO") temp)
  (cond
    ((and smoke (> temp 60))
     (format t "ALERT: Fire detected!~%"))
    ((and smoke (<= temp 60))
     (format t "WARNING: Smoke detected, no fire.~%"))
    ((> temp 60)
     (format t "WARNING: High temperature.~%"))
    (t
     (format t "Status: All clear.~%"))))

(fire-alarm t 80)
(format t "~%")
(fire-alarm t 30)
(format t "~%")
(fire-alarm nil 70)
(format t "~%")
(fire-alarm nil 25)
