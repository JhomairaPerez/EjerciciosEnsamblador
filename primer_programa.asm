section .data
	mensaje db "Hola ensamblador"
	tamano equ $-mensaje ;nos permite calcular el numero de caracteres en una variable

section .text
	global _start;

_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, mensaje 
	mov edx, tamano ; se imprime l numero de caracteres
	int 80H ;Interrupción 

	mov eax, 1
	int 80H

	;#Para ejecutar:
	;- Ir a la carpeta
	;ls
	;nasm -f elf primer_programa.asm 
	;ld -m elf_i386 -s -o primer primer_programa.o
	;./primer

	
