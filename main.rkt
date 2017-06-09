#lang racket

(require "rules.rkt")

(provide (rename-out [my-module-begin #%module-begin]
                     [my-app #%app]
                     [my-top #%top])
         #%datum)

(define-syntax-rule (my-module-begin e1 ...)
  (#%module-begin (draw-rule (list e1 ...))))

(define-syntax-rule (my-app e1 e2 ...)
  (list e1 e2 ...))

(define-syntax-rule (my-top . s)
  's)


                     