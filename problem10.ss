#!/usr/bin/env gosh

(use srfi-1)

(define (make-prime-predicator upper-limit)
  (define lookup-table (make-vector (+ upper-limit 1) #t))
  (define (prime? n) (vector-ref lookup-table n))
  (vector-set! lookup-table 0 #f)
  (vector-set! lookup-table 1 #f)
  (vector-set! lookup-table 2 #t)
  (let sieving-loop ((i 3))
    (if (> (* i i) upper-limit) prime?
        (begin
          (if (even? i) (vector-set! lookup-table i #f)
              (when (prime? i)
                    (let sieve-composites ((composite (* i 2)))
                      (when (<= composite upper-limit)
                            (vector-set! lookup-table composite #f)
                            (sieve-composites (+ composite i))))))
          (sieving-loop (+ i 1))))))

(define (solve)
  (define prime? (make-prime-predicator 2000000))
  (apply + (cons 2 (filter prime? (iota (- 1000000 1) 3 2)))))

(define (main argv)
  (display (solve))
  (newline))
