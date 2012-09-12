#!/usr/bin/env gosh

(use srfi-1)

(define (multiple-of? n m) (zero? (modulo n m)))

(define (solve)
  (apply + (filter (lambda (n) (or (multiple-of? n 3) (multiple-of? n 5)))
                   (iota 1000))))

(define (main argv)
  (display (solve))
  (newline))
