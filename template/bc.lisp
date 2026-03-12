(setq rules '(
    ((salary-high credit-good) loan-approved)
))

(defun backward-chain (goal rules facts)
  (or (member goal facts)

      (some (lambda (r)
              (and (equal goal (cadr r))
                   (every (lambda (c)
                            (backward-chain c rules facts))
                          (car r))))
            rules)))



(setq facts '(salary-high credit-good))

(format t "~A~%" (backward-chain 'loan-approved rules facts))