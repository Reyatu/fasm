; Patches libdirectdraw_plugin.dll to allow either window's X or Y to be 0

; Last Change: 2015 April 18

format PE console

include 'win32.inc'

.text

	push	NULL
	push	FILE_ATTRIBUTE_NORMAL
	push	OPEN_EXISTING
	push	NULL
	push	FILE_SHARE_READ
	push	GENERIC_READ or GENERIC_WRITE
	push	file_name
	call	[CreateFileA]

	cmp	eax, INVALID_HANDLE_VALUE
	je	exit_process

	mov	ebx, eax

	push	FILE_BEGIN
	push	NULL
	push	PATCH_OFFSET
	push	eax
	call	[SetFilePointer]

	cmp	eax, INVALID_SET_FILE_POINTER
	je	exit_process

	push	NULL
	push	bytes
	push	new_data.size
	push	new_data
	push	ebx
	call	[WriteFile]

exit_process:
	push	0
	call	[ExitProcess]

alignz 4

file_name db 'libdirectdraw_plugin.dll', 0
alignz 4

; NOTE: For v2.2.1
; XXX:	CRC-32: B3A89B61

; The original disassembly at offset 562Dh are the following instructions:
;	mov	esi, CW_USEDEFAULT		; BE 00 00 00 80
;	mov	edx, [ebx + 58h]		; 8B 53 58
;	mov	eax, [ebx + 54h]		; 8B 43 54
;	mov	[esp + 20h], ecx		; 89 4C 24 20
;	mov	ecx, [esp + 34h]		; 8B 4C 24 34
;	mov	[esp + 2Ch], ebx		; 89 5C 24 2C
;	mov	dword [esp + 24h], 0		; C7 44 24 24 00 00 00 00
;	test	edx, edx			; 85 D2
;	mov	[esp + 0Ch], edi		; 89 7C 24 0C
;	mov	dword [esp + 08h], 6A30AE40h	; C7 44 24 08 40 AE 30 6A
;	cmovz	edx, esi			; 0F 44 D6
;	test	eax, eax			; 85 C0
;	mov	[esp + 04h], ecx		; 89 4C 24 04
;	cmovz	eax, esi			; 0F 44 C6

PATCH_OFFSET = 562Dh

new_data:
	; 7-byte nop
	db 0Fh, 1Fh, 80h, 00h, 00h, 00h, 00h

	mov	edx, [ebx + 58h]		; 8B 53 58
	mov	eax, [ebx + 54h]		; 8B 43 54
	mov	[esp + 20h], ecx		; 89 4C 24 20
	mov	ecx, [esp + 34h]		; 8B 4C 24 34
	mov	[esp + 2Ch], ebx		; 89 5C 24 2C
	mov	dword [esp + 24h], 0		; C7 44 24 24 00 00 00 00
	mov	[esp + 0Ch], edi		; 89 7C 24 0C
	mov	dword [esp + 08h], 6A30AE40h	; C7 44 24 08 40 AE 30 6A
	mov	[esp + 04h], ecx		; 89 4C 24 04

	; 8-byte nop
	db 0Fh, 1Fh, 84h, 00h, 00h, 00h, 00h, 00h
    .size = $ - new_data

; NOTE: For older version {{{
; XXX:	CRC-32: 89FE0A40

; The original disassembly at offset 5582h are the following instructions:
;	test	esi, esi		; 85 F6
;	cmovz	esi, edx		; 0F 44 F2
;	cmp	dword [ebx + 50h], 0	; 83 7B 50 00
;	cmovne	edx, [ebx + 50h]	; 0F 45 53 50

;PATCH_OFFSET = 5582h

;new_data:
;	mov	edx, [ebx + 50h]	; 8B 53 50

;	; 10-byte nop
;	db	66h, 66h, 0Fh, 1Fh, 84h, 00h, 00h, 00h, 00h, 00h
;    .size = $ - new_data
; }}}

kernel = 1
include 'idata\hnt.inc'

.idata

include 'idata\it.inc'

bytes dd ?

; vim:fdm=marker:
