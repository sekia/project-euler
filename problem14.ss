#!/usr/bin/env gosh

(use srfi-1)

(define (solve)
  (define memos
    (let ([memos (make-hash-table)])
      (hash-table-put! memos 1 1)
      memos))
  (define (sequence-length n)
    (let find-memoized-length-loop ([n n] [steps '()] [num-total-steps 0])
      (if (not (hash-table-exists? memos n))
          (find-memoized-length-loop (if (odd? n) (+ (* 3 n) 1) (/ n 2))
                                     (cons (cons n num-total-steps) steps)
                                     (+ num-total-steps 1))
          (let ([num-memoized-steps (hash-table-get memos n)])
            (let memo-loop ([steps steps])
              (unless (null? steps)
                      (receive (n num-steps) (car+cdr (car steps))
                               (hash-table-put! memos n
                                                (+ (- num-total-steps num-steps)
                                                   num-memoized-steps)))
                      (memo-loop (cdr steps)))))))
    (hash-table-get memos n))
  (let ([longest-sequence-length 0]
        [longest-sequence-start 0])
    (for-each (lambda (n)
                (define len (sequence-length n))
                (when (> len longest-sequence-length)
                      (set! longest-sequence-start n)
                      (set! longest-sequence-length len)))
              (iota 999999 1))
    longest-sequence-start))

(define (main argv)
  (display (solve))
  (newline))
