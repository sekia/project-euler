#!/usr/bin/env gosh

(define (solve)
  (define primes (make-vector 10000 0))
  (vector-set! primes 0 2)
  (vector-set! primes 1 3)
  (let prime-search-loop ((i 2) (candidate (+ (vector-ref primes 1) 2)))
    (define (prime? n)
      (let prime-test-loop ((i 0))
        (define prime (vector-ref primes i))
        (cond
         ((or (zero? prime) (< n (* prime prime))) #t)
         ((zero? (modulo candidate prime)) #f)
         (else (prime-test-loop (+ i 1))))))
    (if (prime? candidate)
        (if (< i 10000)
          (begin
            (vector-set! primes i candidate)
            (prime-search-loop (+ i 1) (+ candidate 2)))
          candidate)
        (prime-search-loop i (+ candidate 2)))))

(define (main argv)
  (display (solve))
  (newline))
