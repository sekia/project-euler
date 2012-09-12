#!/usr/bin/env gosh

(use srfi-1)

(define (solve)
  (apply lcm (iota 20 1)))

(define (main argv)
  (display (solve))
  (newline))
