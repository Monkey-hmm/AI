(setq dict '((1 . "ABC") (2 . "XYZ") (3 . "MNO") (4 . "GHI")))

(format t "Dictionary: ~A~%" dict)
(format t "Enter a key (integer): ")
(finish-output)
(setq key (read))

(setq result (assoc key dict))
(if result
    (format t "Found: ~A => ~A~%" (car result) (cdr result))
    (format t "Error: Key ~A not found.~%" key))
