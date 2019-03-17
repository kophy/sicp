#lang racket/base

(define (f g) (g 2))

; expected a procedure that can be applied to arguments
; given: 2
; (f f) -> (f 2) -> (2 2)
(f f)
