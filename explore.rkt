#lang typed/racket


(require rules/rules)
(require typed/racket/draw)

(: make-spec (-> Integer Rule-Spec))
(define (make-spec n)
  (list (list 'value (if (<= n 0) 1 n))
        (list 'dimension 61)
        (list 'init-conf (list (list 0 30 1)))))

(: explore-one (-> Integer (Instance Bitmap%)))
(define (explore-one n)
  (draw-rule (make-spec n)))

(: explore-range (-> Integer Integer (Listof (Instance Bitmap%))))
(define (explore-range start end)
  (map explore-one (range start end)))
