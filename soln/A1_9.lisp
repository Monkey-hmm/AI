(defstruct restaurant name cuisine)

(defun describe-restaurant (r)
  (format t "Restaurant: ~A, Cuisine: ~A~%" (restaurant-name r) (restaurant-cuisine r)))

(defun open-restaurant (r)
  (format t "~A is now open!~%" (restaurant-name r)))

(setq r (make-restaurant :name "Taj Mahal" :cuisine "Indian"))
(format t "Name: ~A~%" (restaurant-name r))
(format t "Cuisine: ~A~%" (restaurant-cuisine r))
(describe-restaurant r)
(open-restaurant r)

(defstruct user first-name last-name age email city)

(defun describe-user (u)
  (format t "User: ~A ~A, Age: ~A, Email: ~A, City: ~A~%"
          (user-first-name u) (user-last-name u)
          (user-age u) (user-email u) (user-city u)))

(defun greet-user (u)
  (format t "Hello ~A ~A! Welcome!~%" (user-first-name u) (user-last-name u)))

(setq u1 (make-user :first-name "Alice" :last-name "Smith" :age 25 :email "alice@mail.com" :city "Delhi"))
(setq u2 (make-user :first-name "Bob" :last-name "Jones" :age 30 :email "bob@mail.com" :city "Mumbai"))

(format t "~%")
(describe-user u1)
(greet-user u1)
(describe-user u2)
(greet-user u2)
