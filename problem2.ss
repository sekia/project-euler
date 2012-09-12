#!/usr/bin/env gosh

(use srfi-1)

(define (solve)
  (define fibonacci-sequence
    (let fibonacci-generation-loop ((fibonacci-sequence '(1 1)))
      (define next-value (+ (first fibonacci-sequence)
                            (second fibonacci-sequence)))
      (if (> next-value 4000000) fibonacci-sequence
          (fibonacci-generation-loop (cons next-value fibonacci-sequence)))))
  (apply + (filter even? fibonacci-sequence)))

(define (main argv)
  (display (solve))
  (newline))
