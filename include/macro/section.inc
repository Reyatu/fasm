; Last Change: 2015 January 22

macro .text { section '.text' code executable readable }

macro .rdata { section '.rdata' data readable }

macro .data { section '.data' data readable writeable }

macro .bss { section '.bss' readable writeable }

macro .idata { section '.idata' import data readable writeable }
