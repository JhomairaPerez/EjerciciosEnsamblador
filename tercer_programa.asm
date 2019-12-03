section .data
    mensaje db "Ingrese su nombre: ",10
    tamano equ $-mensaje

    mensaje2  db "El nombre ingresado es: "
    tamano2 equ $-mensaje2 


section .bss 
    nombre resb 6
    ;tamano3 equ $-nombre

section .text
    global _start

_start:
    ;imprime mensaje 1*********
    mov eax, 4
	mov ebx, 1
	mov ecx, mensaje 
	mov edx, tamano ; se imprime l numero de caracteres
	int 80H ;#Interrupción 

    ;imprime mensaje 2********
    mov eax, 3
    mov ebx, 2
    mov ecx, nombre
    mov edx, 6
    int 80H

    ;imprime mensaje 3 *******
    mov eax, 4
	mov ebx, 1
	mov ecx, mensaje2
	mov edx, tamano2 
	int 80H 

    ;imprimir nombre *************
    mov eax, 4
	mov ebx, 1
	mov ecx, nombre
	mov edx, 6
	int 80H 

    mov eax, 1
    int 80H