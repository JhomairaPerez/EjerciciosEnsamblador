section .data
    mensaje db "Desplejar los asteriscos 9 veces ",10
    len equ $-mensaje

section .text
    global _start

_start:
    ;imprime mensaje 1*********
    mov eax, 4
	mov ebx, 1
	mov ecx, mensaje 
	mov edx, len ; se imprime l numero de caracteres
	int 80H ;#Interrupción 

    mov [mensaje], dword 'HOLA'

    mov eax, 4
	mov ebx, 1
	mov ecx, mensaje 
	mov edx, len 
	int 80H 

    mov [mensaje+15], dword '****'
    
    mov eax, 4
	mov ebx, 1
	mov ecx, mensaje 
	mov edx, len 
	int 80H 


    mov eax, 1
	int 80H 
    ; DWORD directiva propia del nasm 