section .data
    mensaje db "Desplejar los asteriscos 9 veces ",10
    len equ $-mensaje

    asterisco times 9 db '*', 10
    len_asterisco equ $-asterisco

section .text
    global _start

_start:
    ;imprime mensaje 1*********
    mov eax, 4
	mov ebx, 1
	mov ecx, mensaje 
	mov edx, len ; se imprime l numero de caracteres
	int 80H ;#Interrupción 
   

    mov eax, 4
	mov ebx, 1
	mov ecx, asterisco 
	mov edx, len_asterisco 
	int 80H 


    mov eax, 1
	int 80H 