; Macros to align code and data

; Last Change: 2015 March 11

; Align with multi-byte nops
macro align value {
  local a

  virtual
    align value
    a = $ - $$
  end virtual

  db (a / 10) dup (66h, 66h, 0Fh, 1Fh, 84h, 00h, 00h, 00h, 00h, 00h)

  a = a mod 10

  if a = 9
    db 66h, 0Fh, 1Fh, 84h, 00h, 00h, 00h, 00h, 00h
  else if a = 8
    db 0Fh, 1Fh, 84h, 00h, 00h, 00h, 00h, 00h
  else if a = 7
    db 0Fh, 1Fh, 80h, 00h, 00h, 00h, 00h
  else if a = 6
    db 66h, 0Fh, 1Fh, 44h, 00h, 00h
  else if a = 5
    db 0Fh, 1Fh, 44h, 00h, 00h
  else if a = 4
    db 0Fh, 1Fh, 40h, 00h
  else if a = 3
    db 0Fh, 1Fh, 00h
  else if a = 2
    db 66h, 90h
  else if a = 1
    db 90h
  end if
}

; Align with zeros
macro alignz value {
  local a

  virtual
    align value
    a = $ - $$
  end virtual

  rb a
}

; vim:sts=2:
