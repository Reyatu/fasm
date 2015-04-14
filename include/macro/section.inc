; Macros for defining sections

; Last Change: 2015 April 14

macro .text { section '.text' code executable readable }

macro .rdata { section '.rdata' data readable }

macro .data { section '.data' data readable writeable }

macro .bss { section '.bss' readable writeable }

macro .idata { section '.idata' import data readable writeable }

macro .reloc { section '.reloc' fixups data readable discardable }

; vim:sts=2:
