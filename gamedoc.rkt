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
; game state will be a structure with a listofblocks,
;      grid, number of spaces left,

;-----------------------------------------------------------------------------
; GRIDPOS
;-----------------------------------------------------------------------------

;;; DATA DEFINITION & INTERPRETATION
;;;------------------------------------
(define-struct gridpos [posn])
; A GridPos is a (make-gridpos Posn)
; - posn is the position of a grid
; Interpretation: The grid position of a block

;;; EXAMPLES
;;;---------------
(define GP1 (make-gridpos (make-posn 70 70)))
(define GP2 (make-gridpos (make-posn 190 310)))
(define GP3 (make-gridpos (make-posn 430 430)))

;;; TEMPLATE
;;;------------
#;(define (gp-temp gp)
    ...(posn-x (gridpos-posn gp))...(posn-y (gridpos-posn gp)))

;-----------------------------------------------------------------------------
; BlOCKS
;-----------------------------------------------------------------------------

;;; DATA DEFINITION & INTERPRETATION
;;;------------------------------------
(define-struct block [box gridpos numval])
; A Block is a (make-block Image GridPos Number)
; - box is the image of the block (specific color and number)
; - gridpos is the grid position of the block
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

;;; EXAMPLES OF BLOCKS
;;;-----------------------
#|(define B2 (make-gridpos 2 2) (make-block box2 2))
(define B4 (make-gridpos 1 3) (make-block box4 4))
(define B128 (make-gridpos 4 4) (make-block box128 128))
(define B256 (make-gridpos 3 2) (make-block box256 256))
(define B2048 (make-gridpos 1 1) (make-block box2048 2048))|#


;;; TEMPLATE
;;;------------
#;(define (block-temp block)
    ...(block-box block)...
    (gp-temp (block-gridpos block))...(block-numval block))


;-----------------------------------------------------------------------------
; GAMESTATE
;-----------------------------------------------------------------------------

;;; DATA DEFINITION & INTERPRETATION
;;;------------------------------------
(define-struct gs [blocks grid spacesleft])
; A GameState is a (make-gs [ListOf Block] Image Number[0,14])
; - blocks is a list of all blocks in the grid
; - grid is the image of the blocks in their different positions
; - spacesleft is the number of spaces left in the grid
; Interpretation: A game of 2048


;;; GRID STUFF
;;;---------------
(define GAP (rectangle 20 100 "solid" "darkblue"))
(define HGAP (rectangle 500 20 "solid" "darkblue"))
(define BLANK-SQUARE (square 100 "solid" "lightblue"))
(define ROW
  (beside GAP BLANK-SQUARE GAP BLANK-SQUARE
          GAP BLANK-SQUARE GAP BLANK-SQUARE GAP))

(define EMPTY-GRID
  (above HGAP ROW HGAP ROW HGAP ROW HGAP ROW HGAP))


;;; EXAMPLES
;;;-------------
;(define GS0 (make-gs (list B2 B2) <grid-goes-here> 14))
;(define GS1 (make-gs (list B2 B4 B8) <grid-goes-here> 11))






















