#lang scheme
(define (getFirst lis n)
  (cond 
    ((null? lis) '())
    ((= n 0) '())
    (else (cons (car lis) (getFirst (cdr lis) (- n 1))))
    )
  )

(define (getRest lis n)
  (cond
    ((null? lis) '())
    ((= n 0) lis)
    (else (getRest (cdr lis) (- n 1)))
    )
  )

(define (split lis n)
    (list (getFirst lis n) (getRest lis n))
  )
