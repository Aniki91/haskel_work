(clear)

(defglobal ?*count* = 0)

(deftemplate person "People in actuarial database"
    (slot age (default -1))
    (slot name )
    (slot gender))
	
(deftemplate oldest-male (slot name) (slot age))

(assert (person (gender Male) (name "Mitt Romney") (age 61) ))
(assert (person (name "Bob Smith") (age 34) (gender Male)))
(assert (person (gender Male) (name "Tom Smith") (age 32) ))
(assert (person (name "Mary Smith") (age 34) (gender Female)))
(assert (person  (name "George Bush") (gender Male)))

(assert (person (gender Female)))

(defrule oldest-male-rule
    (person (name ?n) (age ?a) <gender Male)
	=>
	(if (> ?a ?*count*)
	then
		(bind ?*count* ?a)
	)
)   

(defrule show-oldest-male
	?f1 <- (done)
	(person (name ?n) (age ?a) (gender Male))
	=>
	(if (= ?a ?*count*)
	then
		(printout t ?n " is the oldest Male. He is " ?a " years old." crlf)
)

(deffunction find-oldest-male()
	(run)
	(assert (done))
	(run)
)

(find-oldest-male)
	
	