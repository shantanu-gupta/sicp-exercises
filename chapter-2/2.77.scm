;;	(load "generic-arithmetic.scm")
;;	(magnitude z)
;;	= (apply-generic 'magnitude z)	; z is 'complex
;;	= (magnitude z) ; z is 'rectangular or 'polar
;;	= (apply-generic 'magnitude z)
;;	= (magnitude-polar/magnitude-rectangular z)
;;
;;	apply-generic called twice. Once on 'complex, and once more on
;;	'rectangular/'polar.
