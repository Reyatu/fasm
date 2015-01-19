; Macro for defining enum

; Last Change: 2015 January 18

macro enum dummy, [name] {
  common
    local i
    i = 0

  forward
    local x
    x = i
    match _name == value, name \{
      i = value
      _name = i
    \}
    ; TODO: Figure out how to do "if not matched"
    if i = x
      name = i
    end if
    i = i + 1
}
