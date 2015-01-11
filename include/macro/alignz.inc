; Macro to align with zeros instead of nops

; Last Change: 2014 December 24

macro alignz value { rb (- $) and (value - 1) }
