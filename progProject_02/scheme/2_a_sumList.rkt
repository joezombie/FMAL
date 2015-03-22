#lang racket
(define (sumList lis)
  (if (null? lis) 
    0
    (+ (car lis) (sumList (cdr lis)))
    )
  )