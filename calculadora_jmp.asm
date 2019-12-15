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

    mensajee db 10,"**Operacion de suma de 8 bits**",10
    tam equ $ - mensajee

    mensajeee db 10, "El resultado es: "
    taman equ $ - mensajeee

    mensajeresta db 10, "**Operacion de resta de 8 bits**",10
    tamresta equ $ - mensajeresta

    mensajerestaa db 10, "El resultado es: "
    tamanioresta equ $ - mensajerestaa

    mensaje0 db 10, "**Operacion de multiplicacion de 8 bits**",10
    tamanio equ $ - mensaje0

    mensaje01 db 10, "El resultado es: "
    tamanio2 equ $ - mensaje01

    mensaje1 db 10, "**Operacion de division de 8 bits**",10
    len1 equ $ - mensaje1

    mensaje2 db 10, "El cociente es: "
    len2 equ $ - mensaje2
    mensaje3 db 10, "El residuo es : "
    len3 equ $ - mensaje3

    new_line db 10, " "

section .bss
    n1 resb 1
    n2 resb 1  
    suma resb 1
    resta resb 1
    resul resb 1  
    residuo resb 1 ; resb directiva donde establece espacios 
    cociente resb 1

section .text
    global _start

_start:            
           

;************numero 1*************
    escribir mens, len
    leer n1, 2
;************numero 2*************
    escribir mensaje, lenn
    leer n2, 2

     jmp dividir
;***********proceso Suma *************
sumar: 
            mov eax,[n1]
            mov ebx,[n2]
            sub eax, '0'
            sub ebx, '0'
            add eax, ebx
            add eax, '0'
            
            mov [suma], eax

            ;imprimir suma
            escribir mensajee, tam 
            escribir mensajeee, taman       
            escribir suma, 1

            jmp multiplicar

;***********proceso resta********************
restar:    
            mov eax,[n1]
            mov ebx,[n2]
            sub eax, '0'
            sub ebx, '0'
            sub eax, ebx
            add eax, '0'
            
            mov [resta], eax

            ;imprimir resta
            escribir mensajeresta, tamresta
            escribir mensajerestaa, tamanioresta      
            escribir resta, 1

            jmp salir

;***********proceso Multiplicacion **************    
multiplicar:
            mov al, [n1]
            mov bl, [n2]
            sub al, '0'
            sub bl, '0'
            mul bl
            add al, '0'
            mov [resul], al  

            ;imprimir multiplicacion
            escribir mensaje0, tamanio 
            escribir mensaje01, tamanio2       
            escribir resul, 1

            jmp restar

;***********proceso Division ***************    
dividir:
            mov al, [n1]
            mov bl, [n2]
            sub al, '0'
            sub bl, '0'
            div bl
            add al, '0'
            mov [cociente], al 
            add ah, '0'
            mov [residuo], ah  

            ;cociente
            escribir mensaje1, len1 
            escribir mensaje2, len2       
            escribir cociente, 1

            ;residuo
            escribir mensaje3, len3  
            escribir residuo, 1

            jmp sumar

;************final************************
salir:
            escribir new_line, 1
            mov eax, 1
            int 80h

;JhomairaPerez
; para transformar de numero a cadena se suma '0'
;add registro, registro, '0'
;sub registro, '0'
; para transformar un cadena a numro resto

