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



(setq rules
 '(((fever cough) flu)
   ((fever headache) malaria)))

(defun backward-chain (goal rules facts)
  (or (member goal facts)

      (some (lambda (r)
              (and (equal goal (cadr r))
                   (every (lambda (c)
                            (prove c rules facts))
                          (car r))))
            rules)))



(defun evaluate-actions (facts rules)
  (loop for r in rules
        when (every (lambda (c) (member c facts))
                    (car r))
        collect (cadr r)))








#Helper for all fn below
(defun rule-match (rule facts)
  (every (lambda (c) (member c facts))
         (car rule)))

(defun modus-ponens (facts rules)
  (loop
    with new = nil
    do
      (setq new
        (loop for r in rules
              when (rule-match r facts)
              collect (cadr r)))

      (setq new (remove-if (lambda (x) (member x facts)) new))

      (if (null new)
          (return facts)
          (setq facts (append facts new)))))



(defun fc-with-comflict (facts rules)

  (let* ((matches
          (loop for r in rules
                when (rule-match r facts)
                collect r))

         (best
          (car (sort matches #'> :key #'caddr))))

    (if best
        (cadr best)
        'unknown)))