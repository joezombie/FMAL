#lang scheme
(define (maxElement lis)
  (if (null? (cdr lis)) 
    (car lis)
    (let
      (
        (head (car lis))
        (nextMax (maxElement (cdr lis)))
        )
      (if (> head nextMax)
        head
        nextMax
        )
      )
    )
  )