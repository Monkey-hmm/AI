(setq rules
 '(((smoke-detected high-temperature) fire-alert)
   ((smoke-detected (not high-temperature)) smoke-warning)))


(setq facts '(smoke-detected high-temperature))


(defun evaluate-actions (facts rules)
  (loop for r in rules
        when (every (lambda (c) (member c facts))
                    (car r))
        collect (cadr r)))

(format t "~A~%" (evaluate-actions facts rules))