#lang scheme
(define (charCount sym) (string-length (symbol->string sym)))

(define (charactersPerWord lis)
  (if (null? lis)
    '()
    (cons (charCount (car lis)) (charactersPerWord (cdr lis)))
    ) 
  )
