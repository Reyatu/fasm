; References:
; http://board.flatassembler.net/topic.php?p=9871#9871
; http://board.flatassembler.net/topic.php?p=42183#42183

; Last Change: 2015 January 09

macro ifndef expr* {
  local ..HERE
  if defined ..HERE | ~ defined expr
    ..HERE = 1
}
