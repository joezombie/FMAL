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

(define (elementAtIndex lis n)
  (if(= n 1)
     (car lis)
     (elementAtIndex (cdr lis) (- n 1))
     )
  )

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


(define (maxofmax lis)
  (maxElement (map maxElement lis))
  )

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

(maxElement '(5 3 7 2 6 1 4))
(elementAtIndex '(a b c d e f) 4)
(compress '(a a a b b c c c d d d d e f f))
(maxofmax '((5 3 6 2) (1 6 2 7) (7 3 8 2 9) (6 2 4 1)))
(split '(a b c d e f g) 3)
(sumList ' (5 4 3))
(charactersPerWord ' (Scheme is so wonderful))
(charactersPerSentence '((Hello Mary) (Scheme is so wonderful) (See you later) (John)))
(wordsPerSentence '((Hello Mary) (Scheme is so wonderful) (See you later) (John)))
(statsDocument '((Hello Mary) (Scheme is so wonderful) (See you later) (John)))