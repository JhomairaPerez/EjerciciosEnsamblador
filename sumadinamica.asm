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
    mensaje1 db "Ingrese el primer numero",10
    len1 equ $ - mensaje1
    mensaje2 db "Ingrese el segundo numero",10
    len2 equ $ - mensaje2

    mensaje db "El resultado es : ", 10
    len equ $ - mensaje

section .bss
    n1 resb 1
    n2 resb 1
    suma resb 1 ; resb directiva donde establece espacios 

section .text
    global _start

_start:
;**************Ingreso el 1 numero*******************
    escribir mensaje1, len1 
    leer n1, 2

;**************Ingreso el 2 numero*******************

    escribir mensaje2, len2
    leer n2, 2


;**************Proceso de suma*******************

    mov eax,[n1]
    mov ebx,[n2]
    sub eax, '0'
    sub ebx, '0'
    add eax, ebx
    add eax, '0'
    
    mov [suma], eax

;**************Imprime suma*******************
    
    escribir mensaje, len
    escribir suma, 1

    mov eax, 1
    int 80h



