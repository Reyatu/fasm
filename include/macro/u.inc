; Reference:	http://board.flatassembler.net/topic.php?p=154866#154866
; Last Change:	2015 January 17

macro u [arg] {
  common
    inst equ
    irps argn, arg \{

  \forward
      inst equ inst argn
      match \` argn, argn \\{
	\\local ustr
	restore inst
	virtual
	  du argn
	  assert $ - $$ <= 4
	  load ustr dword from $$
	end virtual
	inst equ inst ustr
      \\}

  \common
      match inst, inst \\{ inst \\}

  \forward
      restore inst
    \}
    restore inst
}
