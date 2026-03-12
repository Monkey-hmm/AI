(setq rules '(
    ((performance-high experience-5plus) promote)
    ((performance-high leadership) promote)
    ((disciplinary-action) no-promote)
))

(setq facts '(
    performance-high
    experience-5plus
    no-disciplinary-action
    leadership-skills
))

(defun forward-chain (facts rules)
  (loop
     with new = nil
     do
       (setq new
             (loop for r in rules
                   when (every (lambda (c) (member c facts))
                               (car r))
                   collect (cadr r)))
       (setq new (remove-if (lambda (x) (member x facts)) new))
       (if (null new)
           (return facts)
           (setq facts (append facts new)))))


(format t "~A~%" (forward-chain facts rules))