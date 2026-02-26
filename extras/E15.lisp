(defun unify (t1 t2 bindings)
  (cond
    ((equal t1 t2) bindings)
    ((and (symbolp t1) (is-var t1))
     (cons (cons t1 t2) bindings))
    ((and (symbolp t2) (is-var t2))
     (cons (cons t2 t1) bindings))
    ((and (listp t1) (listp t2) (= (length t1) (length t2)))
     (let ((b bindings))
       (loop for a in t1
             for c in t2
             do (setq b (unify a c b))
             when (eq b 'fail) return 'fail)
       b))
    (t 'fail)))

(defun is-var (s)
  (and (symbolp s) (char= (char (string s) 0) #\?)))

(defun test-unify (t1 t2)
  (format t "Unify ~A with ~A~%" t1 t2)
  (let ((result (unify t1 t2 nil)))
    (if (eq result 'fail)
        (format t "  FAIL~%")
        (format t "  Bindings: ~A~%" result))))

(test-unify '(P ?x a) '(P b a))
(format t "~%")
(test-unify '(Q ?x ?y) '(Q 1 2))
(format t "~%")
(test-unify '(R a b) '(R a c))
