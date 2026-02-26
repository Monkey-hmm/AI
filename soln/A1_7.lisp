(setq library nil)

(defun add-book (title author year)
  (push (list title author year) library)
  (format t "Added: ~A by ~A (~A)~%" title author year))

(defun search-book (title)
  (dolist (book library)
    (when (string-equal (first book) title)
      (format t "Found: ~A by ~A (~A)~%" (first book) (second book) (third book))
      (return-from search-book)))
  (format t "Book '~A' is not available.~%" title))

(add-book "The Pragmatic Programmer" "Andy Hunt" 1999)
(add-book "Clean Code" "Robert Martin" 2008)
(add-book "SICP" "Abelson & Sussman" 1985)

(format t "~%")
(search-book "Clean Code")
(search-book "Unknown Book")
