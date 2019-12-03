section .data
    mensaje1 db "Ingrese el primer numero"
    len1 equ $ - mensaje1

    mensaje2 db "Ingrese el segundo numero"
    len2 equ $ - mensaje2

    mensaje db "El resultado : ", 10
    len equ $ - mensaje

section .bss
    n1 resb 1
    n2 resb 1
    suma resb 1 ; resb directiva donde establece espacios 

section .text
    global _start

_start:
;**************Ingreso el 1 numero*******************
    mov eax, 4
    mov ebx, 1
    add ecx, mensaje1
    add edx, len1
    int 80h
 
    mov eax, 3
    mov ebx, 0
    add ecx, n1
    add edx, 2
    int 80h

;**************Ingreso el 2 numero*******************

    mov eax, 4
    mov ebx, 1
    add ecx, mensaje2
    add edx, len2
    int 80h
 
    mov eax, 3
    mov ebx, 0
    add ecx, n2
    add edx, 2
    int 80h

;**************Proceso de suma*******************

    mov eax,[n1]
    mov ebx,[n2]
    sub eax, '0'
    sub ebx, '0'
    add eax, ebx
    add eax, '0'
    
    mov [suma], eax

;**************Imprime suma*******************
    
    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje
    mov edx, len
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, suma
    mov edx, 2
    int 80h

    mov eax, 1
    int 80h
; para transformar de numero a cadena se suma '0'
;add registro, registro, '0'
;sub registro, '0'
; para trnsformar una cadena a numero resto '0'


