%macro escribir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

%macro leer 2
  mov eax, 3
  mov ebx, 0
  mov ecx, %1
  mov edx, %2
  int 80h
%endmacro

section .data

    msj1 db "Ingrese un numero: "
	len1 equ $-msj1

    new_line db '',10

section .bss

    numero resb 1

section .text

    global _start

_start:
;*******escribir y leer numero***************
    escribir msj1, len1
    leer numero, 1

principal:

    cmp cx, 0
    jz salir
    jmp decrementar

decrementar:

    
    mov eax, [numero]
    sub eax, '0'
    dec eax
    push eax
    escribir numero, 1 
    escribir new_line,1
    pop eax
    mov ecx, eax
    add eax, '0'
    mov [numero], eax

    jmp principal


salir:

    mov eax, 1
    int 80h