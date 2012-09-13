#!/usr/bin/env gosh

(define (square n) (* n n))

(define (solve)
  (let outer-loop ((i 1))
    (let inner-loop ((j 1))
      (define k (sqrt (+ (square i) (square j))))
      (cond
       ((= (+ i j k) 1000) (* i j (inexact->exact k)))
       ((> (+ i j k) 1000) (outer-loop (+ i 1)))
       (else (inner-loop (+ j 1)))))))

(define (main argv)
  (display (solve))
  (newline))
