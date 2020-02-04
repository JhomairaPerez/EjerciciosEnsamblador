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

    msj db 10,"Archivo creado",10
    len_msj equ $ -msj 

    msj2 db 10,"Ingrese el path",10
    len_msj2 equ $ -msj2    

section .bss

    archivo resb 8

section .text
    global _start

_start:

    escribir msj2, len_msj2
    leer archivo, 50

    mov eax, 8 ; servicio para crear un archivo
    mov ebx, archivo; define la ruta del servicio
    mov ecx, 0x1FF ; definimos el permiso 777  
    int 80h

    escribir msj, len_msj

    mov eax, 1
    int 80H








    