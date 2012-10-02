#!/usr/bin/env gosh

(use srfi-1)

(define (leap-year? year)
  (cond
   ((and (zero? (remainder year 100)) (not (zero? (remainder year 400)))) #f)
   ((zero? (remainder year 4)) #t)
   (else #f)))

(define (days-of year month)
  (case month
    ((1 3 5 7 8 10 12) 31)
    ((4 6 9 11) 30)
    ((2) (if (leap-year? year) 29 28))))

(define (day-of-week-after wday days)
  (define offset
    (case wday
      ((Sun) 0)
      ((Mon) 1)
      ((Tue) 2)
      ((Wed) 3)
      ((Thu) 4)
      ((Fri) 5)
      ((Sat) 6)))
  (list-ref '(Sun Mon Tue Wed Thu Fri Sat)
            (remainder (+ offset days) 7)))

(define (solve)
  (define wday-of-1-Jan-1901
    (day-of-week-after 'Mon
                       (apply + (map (cut days-of 1900 <>)
                                     (iota 12 1)))))
  (let yearly-loop ((sundays 0)
                    (wday wday-of-1-Jan-1901)
                    (year 1901))
    (if (> year 2000) sundays
        (receive (sundays-of-this-year first-wday-of-next-year)
                 (let monthly-loop ((sundays 0)
                                    (wday wday)
                                    (month 1))
                   (if (> month 12) (values sundays wday)
                       (monthly-loop
                        (if (eq? wday 'Sun) (+ sundays 1) sundays)
                        (day-of-week-after wday (days-of year month))
                        (+ month 1))))
                 (yearly-loop (+ sundays sundays-of-this-year)
                              first-wday-of-next-year
                              (+ year 1))))))

(define (main argv)
  (display (solve))
  (newline))
