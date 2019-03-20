#lang racket

(require rackunit)

;; ''abracadabra -> (quote (quote abracadabra))
(car ''abracadabra)
