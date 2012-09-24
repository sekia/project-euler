#!/usr/bin/env gosh

(use srfi-1)

(define (count-routes num-cells)
  (define lookup-table
    (let ([row-vectors (make-vector (+ num-cells 1))])
      (for-each (lambda (i)
                  (vector-set! row-vectors i (make-vector (+ num-cells 1) #f)))
                (iota (+ num-cells 1)))
      row-vectors))
  (define (lookup-memo x y) (vector-ref (vector-ref lookup-table y) x))
  (define (count-routes-1 x y)
    (cond
     ((or (> x num-cells) (> y num-cells)) 0)
     ((and (= x num-cells) (= y num-cells)) 1)
     (else (or (lookup-memo x y)
               (let ([num-routes (+ (count-routes-1 (+ x 1) y)
                                    (count-routes-1 x (+ y 1)))])
                 (vector-set! (vector-ref lookup-table y) x num-routes)
                 num-routes)))))
  (count-routes-1 0 0))

(define (solve) (count-routes 20))

(define (main argv)
  (display (solve))
  (newline))
