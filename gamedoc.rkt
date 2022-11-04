;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname gamedoc) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;; gonna make 2048 using racket
; grid is 4x4
; possible numbers: 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048
  ; each has a different color, but same size box
; bigbang:
; - onkey = move the blocks & update number of blocks left
; - onrelease = generate a new block & update number of blocks left
; - to-draw = placement of blocks
; - stop-when = no grid space left
; game state will be a structure with a listofblocks, number of spaces left, 