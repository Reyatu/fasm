; Macro to align with zeros instead of nops

; Last Change: 2015 January 23

macro alignz value {
  local a

  virtual
    align value
    a = $ - $$
  end virtual

  rb a
}
