#!/usr/bin/env gosh

(use srfi-1)
(use srfi-13)

(define (palindromic-number? n)
  (define n-string (number->string n))
  (string=? n-string (string-reverse n-string)))

(define (solve)
  (let loop ((i 100) (j 100) (current-max 0))
    (cond
     ((>= i 1000) current-max)
     ((>= j 1000) (loop (+ i 1) (+ i 1) current-max))
     (else
      (let ((product (* i j)))
        (loop i (+ j 1)
              (if (and (> product current-max) (palindromic-number? product))
                  product current-max)))))))

(define (main argv)
  (display (solve))
  (newline))
