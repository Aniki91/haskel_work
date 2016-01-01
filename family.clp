(clear)
(watch all)
(assert (father tom jim))
(assert (brother jim mary))

(defrule family-rule-1
	(father ?x ?y)
	(brother ?y ?z)
	=>
	(assert (father ?x ?z))
	(printout t ?x " is the father of " ?z " too" crlf)
)

;this is a comment