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

    msj db 10,"Carpeta o directorio creado",10
    len_msj equ $ -msj 

    msj2 db 10,"Ingrese el path",10
    len_msj2 equ $ -msj2

    path db '/home/jhomaira/Documentos/Jhom',0
    len_path equ $ - path 

section .bss

    directorio resb 2

section .text
    global _start

_start:

    escribir msj2, len_msj2
    leer directorio, 39

    mov eax, 39 ; servicio para crear un directorio
    mov ebx, directorio; define la ruta del servicio
    mov ecx, 0x1FF ; definimos el permiso 777    
    int 80h

    escribir msj, len_msj

    mov eax, 1
    int 80H








    