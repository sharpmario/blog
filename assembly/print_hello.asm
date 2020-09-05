.code
;==================================
;Arquivo: print_hello.asm
;Proposito: Escreve a string "Hello
; , World!" na saída padrão (video)
;Autor: Guilherme Esmeraldo
;Versao: 1.0
;Codigo em C:
; char msg[13] = "Hello, World!"
; char last_char = '\0'
; int *ptr = msg
; while(*ptr != '0'){
;   putchar(*ptr)
;   ptr = ptr + 1
; exit()
;==================================

next_char: 
	LDI ptr ;get char from string

is_last_chr:
	SUB last_char
	JZ  end

print:
	LDI ptr
	ADD video_address
	INT output ; print char

nextchr:	
	LDA ptr  ; ptr += 1
	ADD one
	STA ptr

	JMP next_char

end:
	INT exit

.data
	msg: DB 'Hello, World!0'
	last_char: DB '0'
	ptr: DD msg
	one: DD 1

	;; Endereço de video formatado para copia no AC
	; Ac High | Ac Low
	; b00000000 | b00000000
	video_address: DD 0

	;codigo de interrupcao de output
	output: DD 21

	;syscall exit
    exit: DD 25

.stack 10
