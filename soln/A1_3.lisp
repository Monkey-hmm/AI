(format t "Enter password: ")
(finish-output)
(setq pw (read-line))
(setq valid t)
(setq has-lower nil)
(setq has-upper nil)
(setq has-digit nil)
(setq has-special nil)

(when (< (length pw) 6) (setq valid nil))
(when (> (length pw) 16) (setq valid nil))

(dotimes (i (length pw))
  (setq ch (char pw i))
  (when (lower-case-p ch) (setq has-lower t))
  (when (upper-case-p ch) (setq has-upper t))
  (when (digit-char-p ch) (setq has-digit t))
  (when (member ch '(#\$ #\# #\@)) (setq has-special t)))

(when (not has-lower) (setq valid nil))
(when (not has-upper) (setq valid nil))
(when (not has-digit) (setq valid nil))
(when (not has-special) (setq valid nil))

(if valid
    (format t "Valid password.~%")
    (format t "Invalid password.~%"))
