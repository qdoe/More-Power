;engage powerup with select
if defined("powerup")
  ORG $83D281
  autoclean JSL powerup
endif

;gets rid of life and timer decrementing
if or(defined("notimer"),defined("nolives"))
;  ORG $af80bc 
;  autoclean JSL set

  ORG $838d3e
  NOP
  NOP
  JML lifesaver

 ; ORG $82bacf
 ; autoclean JSL unset

 ; ORG $afee48
 ; autoclean JSL unset

  ORG $afaf70
  autoclean JSL tog
endif

;freedata
;
;powerups:
;;;;   ng  | elec  | flame |  saw  |  tnt
;db $00,$00,$02,$00,$04,$00,$06,$00,$08,$00




freecode $FF

;probably can be improved
if defined("powerup")
  powerup:
  STA $04,X
  PHX
  DEX
  DEX
  BPL skip
  INX
  INX
  LDA $08,X
  DEX
  DEX
  BIT #$2000
  BEQ skip
  LDA $1803AF
  EOR #$0001
  STA $1803AF
  skip:
  PLX
  DEX
  DEX
  RTL
endif

if or(defined("notimer"),defined("nolives"))
  lifesaver:
  PHA
  LDA $1b50
  BEQ nsk
  
  if defined("nolives")
    LDA #$1a0b
    CMP $ad
    BEQ sk
  endif

  if defined("notimer")
    LDA #$1a13
    CMP $ad
    BNE nsk
    LDA #$0000
    CMP $1a8a
    BNE sk
  endif

  nsk:
  PLA
  PHA
  STA [$ad], Y
  sk:
  PLA
  JML $838a3e

  tog:
  CMP #$0000
  BNE unset
  set:
  PHA
  LDA #$0001
  STA $1b50
  PLA
  JMP end

  unset:
  STZ $1b50
  JMP end

  end:
  LDA #$0300
  TCD
  RTL
  
endif



;;; table 0x1803cd
;00 - nailgun
;02 - elec
;04 - flamethrower
;06 - chainsaw
;08 - dynamite
;weapon:
