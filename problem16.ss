#!/usr/bin/env gosh

(define (solve)
  (apply + (map digit->integer (string->list (number->string (expt 2 1000))))))

(define (main argv)
  (display (solve))
  (newline))
