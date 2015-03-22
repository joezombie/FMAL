#lang scheme
(define (compress lis)
  (cond
    ((null? lis) '()) 
    ((null? (cdr lis)) lis)
    (else 
      (let
        (
          (head (car lis))
          (tail (cdr lis))
          )
        (if (eqv? head (car tail)) 
          (compress tail)
          (cons head (compress tail))
          )
        )
      )
    )
  )