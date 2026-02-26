(defun smart-signal (density accident)
  (format t "Density: ~A, Accident: ~A => Signal: ~A~%"
          density (if accident "YES" "NO")
          (if (and (equal density "high") (not accident)) "GREEN" "RED")))

(smart-signal "high" nil)
(smart-signal "high" t)
(smart-signal "low" nil)
