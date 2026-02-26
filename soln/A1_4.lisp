(setq L nil)
(dotimes (i 10)
  (push (1+ (random 50)) L))
(format t "Original list: ~A~%" L)

(setq sorted (sort (copy-list L) #'>))
(format t "Second largest: ~A~%" (second sorted))

(setq no-odds (remove-if #'oddp L))
(format t "After removing odds: ~A~%" no-odds)

(setq replaced nil)
(dolist (x no-odds)
  (if (> x 30)
      (push "High" replaced)
      (push x replaced)))
(setq replaced (reverse replaced))
(format t "Replaced >30 with High: ~A~%" replaced)

(format t "Reversed: ~A~%" (reverse replaced))

(setq product 1)
(dolist (x replaced)
  (when (numberp x) (setq product (* product x))))
(format t "Product of numeric elements: ~A~%" product)
