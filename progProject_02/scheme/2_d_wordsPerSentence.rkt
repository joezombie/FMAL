#lang scheme
(define (wordsPerSentence lis)
  (if (null? lis)
    '()
    (cons (length (car lis)) (wordsPerSentence (cdr lis)))
    )
  )
