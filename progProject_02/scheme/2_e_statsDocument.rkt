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

(define (wordsPerSentence lis)
  (if (null? lis)
    '()
    (cons (length (car lis)) (wordsPerSentence (cdr lis)))
    )
  )
(define (sentencesPerDocument lis)
  (if (null? lis)
    0
    (+ 1 (sentencesPerDocument (cdr lis)))
    )
  )

(define (statsDocument lis)
  (list
    (sumList (charactersPerSentence lis))
    (sumList (wordsPerSentence lis))
    (sentencesPerDocument lis)
    )
  )
