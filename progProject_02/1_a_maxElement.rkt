#lang scheme
(define (maxElement lis)
  (if (null? (cdr lis)) (car lis)
      (if (> (car lis) (maxElement (cdr lis))) 
          (car lis) 
          (maxElement (cdr lis))
          )
      )
  )