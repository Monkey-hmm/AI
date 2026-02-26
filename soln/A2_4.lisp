(defun traffic-signal (density)
  (format t "Density: ~A => Signal: ~A~%"
          density
          (if (equal density "heavy") "GREEN" "RED")))

(traffic-signal "heavy")
(traffic-signal "light")
(traffic-signal "moderate")
