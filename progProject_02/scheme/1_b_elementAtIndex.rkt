#lang scheme
(define (elementAtIndex lis n)
  (if(= n 1)
     (car lis)
     (elementAtIndex (cdr lis) (- n 1))
     )
  )

