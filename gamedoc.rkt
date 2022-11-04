(require 2htdp/image)
(require 2htdp/universe)
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

;-----------------------------------------------------------------------------
; BlOCKS
;-----------------------------------------------------------------------------

;;; DATA DEFINITION & INTERPRETATION
;;;------------------------------------
(define-struct block [box numval])
; A Block is a (make-block Image Number)
; - box is the image of the block (specific color and number)
; - numval is the numeric value of the block
; Interpretation: A block in the 2048 game.


;;; POSSIBLE BOXES
;;;-----------------
(define box2
  (overlay/align "middle" "middle"
                 (text "2" 24 "white") (square 100 "solid" "mediumgray")))
(define box4
  (overlay/align "middle" "middle"
                 (text "4" 24 "white") (square 100 "solid" "mediumpink")))
(define box8
  (overlay/align "middle" "middle"
                 (text "8" 24 "white") (square 100 "solid" "darkpink")))
(define box16
  (overlay/align "middle" "middle"
                 (text "16" 24 "white") (square 100 "solid" "lightbrown")))
(define box32
  (overlay/align "middle" "middle"
                 (text "32" 24 "white") (square 100 "solid" "mediumbrown")))
(define box64
  (overlay/align "middle" "middle"
                 (text "64" 24 "white") (square 100 "solid" "lightturquoise")))
(define box128
  (overlay/align "middle" "middle"
                 (text "128" 24 "white") (square 100 "solid" "lightpurple")))
(define box256
  (overlay/align "middle" "middle"
                 (text "256" 24 "white") (square 100 "solid" "darkpurple")))
(define box512
  (overlay/align "middle" "middle"
                 (text "512" 24 "white") (square 100 "solid" "lightred")))
(define box1024
  (overlay/align "middle" "middle"
                 (text "1024" 24 "white") (square 100 "solid" "mediumred")))
(define box2048
  (overlay/align "middle" "middle"
                 (text "2048" 24 "white") (square 100 "solid" "black")))

;;; BLOCKS
;;;-----------
(define B2 (make-block box2 2))
(define B4 (make-block box4 4))
(define B8 (make-block box8 8))
(define B16 (make-block box16 16))
(define B32 (make-block box32 32))
(define B64 (make-block box64 64))
(define B128 (make-block box128 128))
(define B256 (make-block box256 256))
(define B512 (make-block box512 512))
(define B1024 (make-block box1024 1024))
(define B2048 (make-block box2048 2048))


























