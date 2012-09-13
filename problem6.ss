#!/usr/bin/env gosh

(use srfi-1)

(define (solve)
  (define numbers (iota 100 1))
  (define sum-of-squares (apply + (map (lambda (n) (expt n 2)) numbers)))
  (define square-of-sum (expt (apply + numbers) 2))
  (- square-of-sum sum-of-squares))

(define (main argv)
  (display (solve))
  (newline))
