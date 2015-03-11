; Emulate defining enum with struc

; Last Change: 2015 February 17

struc enum [name] {
  common
    local i, matched
    i = 0

  forward
    matched = 0
    match _name == value, name \{
      i = value
      _name = value
      matched = 1
    \}
    if ~ matched
      name = i
    end if
    i = i + 1
}

; vim:sts=2:
