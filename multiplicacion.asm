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
    mens db "Ingrese el primer numero",10
    len equ $ - mens
    mensaje db "Ingrese el segundo numero",10
    lenn equ $ - mensaje
    mensaje1 db "Operacion de multiplicacion de 8 bits"
    len1 equ $ - mensaje1

    mensaje2 db 10, "El resultado es: "
    len2 equ $ - mensaje2
    
    new_line db 10, " "

section .bss
    n1 resb 1
    n2 resb 1    
    resul resb 1 ; resb directiva donde establece espacios 
    

section .text
    global _start

_start:

;************numero 1*************
    escribir mens, len
    leer n1, 2
;************numero 2*************
    escribir mensaje, lenn
    leer n2, 2

;***********proceso***************

    escribir mensaje1, len1 
    mov al, [n1]
    mov bl, [n2]
    sub al, '0'
    sub bl, '0'
    mul bl
    add al, '0'
    mov [resul], al         
;**************resultado multiplicacion *******************
    escribir mensaje2, len2       
    escribir resul, 1

;************final************************
    escribir new_line, 1
    mov eax, 1
    int 80h


