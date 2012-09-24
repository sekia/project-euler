#!/usr/bin/env gosh

(define (factorize n)
  (define acc '())
  (let ((factor-2-count 0))
    (while (even? n)
           (set! n (/ n 2))
           (inc! factor-2-count))
    (unless (zero? factor-2-count)
            (push! acc (cons 2 factor-2-count))))
  (let divide-by-odd-loop ((divisor 3))
    (if (< n divisor) acc
        (let ((factor-count 0))
          (while (zero? (modulo n divisor))
                 (set! n (/ n divisor))
                 (inc! factor-count))
          (unless (zero? factor-count)
                  (push! acc (cons divisor factor-count)))
          (divide-by-odd-loop (+ divisor 2))))))

(define (count-divisors n)
  (apply * (map (lambda (factor) (+ (cdr factor) 1)) (factorize n))))

(define (solve)
  (let loop ((i 1) (previous-triangle-number 0))
    (define triangle-number (+ previous-triangle-number i))
    (if (> (count-divisors triangle-number) 500)
        triangle-number
        (loop (+ i 1) triangle-number))))

(define (main argv)
  (display (solve))
  (newline))
