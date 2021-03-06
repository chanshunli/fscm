﻿;(the "rain" in "spain" falls mainly on the "plain")
(let ((x "rain")
(y "spain")
 (z "plain"))
 (quasiquote
 (the (unquote x)
 in (unquote y)
 falls mainly on the (unquote z))))
 
````2 ; => (quasiquote (quasiquote (quasiquote 2)))
````,2 ; => (quasiquote (quasiquote (quasiquote (unquote 2))))
````,@2 ; => (quasiquote (quasiquote (quasiquote (unquote-splicing 2))))
 
(define a 10)
`,a ; => 10
``,a ; => (quasiquote (unquote a))
`(+ 1 2 `,a ,a) ; => (+ 1 2 (quasiquote (unquote a)) 10)
`,```,a ; => (quasiquote (quasiquote (unquote a)))
`(+ 1 2 `,,a) ; => (+ 1 2 (quasiquote (unquote 10)))
```,@a ; => (quasiquote (quasiquote (unquote-splicing a)))


(define x (list 1 2 3))
`(+ ,@x) ; => (+ 1 2 3)
`(+ (+ ,@x)) ; => (+ (+ 1 2 3))
`(+ 1 2 `,@x) ; => (+ 1 2 (quasiquote (unquote-splicing x)))
`(+ 1 2 `,@x ,@x) ; => (+ 1 2 (quasiquote (unquote-splicing x)) 1 2 3)
``,,@x ; => (quasiquote (unquote 1 2 3))
```,@x ; => (quasiquote (quasiquote (unquote-splicing x)))
``,@,@x ; => (quasiquote (unquote-splicing 1 2 3))
```,x ;= > (quasiquote (quasiquote (unquote x)))