#lang scheme
(define (sumList lis)
  (if (null? lis) 
    0
    (+ (car lis) (sumList (cdr lis)))
    )
  )

(define (charCount sym) (string-length (symbol->string sym)))

(define (charactersPerWord lis)
  (if (null? lis)
    '()
    (cons (charCount (car lis)) (charactersPerWord (cdr lis)))
    ) 
  )

(define (charactersPerSentence lis)
  (if (null? lis)
    '()
    (cons (sumList (charactersPerWord (car lis))) (charactersPerSentence (cdr lis)))
    )
  )
