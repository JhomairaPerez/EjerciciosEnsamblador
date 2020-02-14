;Jhomaira Alexandra Perez Quezada :(
%macro imprimir 2
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

    msj_menu db "Menu: ",10,"1 Numero Menor",10,"2 Numero Mayor",10,"3 Ordenar menor a mayor",10
	tam_menu equ $ - msj_menu

	msj_n1 db "Ingrese el primer numero: "
	tam_n1 equ $ - msj_n1

	msj_n2 db "Ingrese el segundo numero: "
	tam_n2 equ $ - msj_n2

	msj_n3 db "Ingrese el tercer numero: "
	tam_n3 equ $ - msj_n3

    msj_n4 db "Ingrese el cuarto numero: "
	tam_n4 equ $ - msj_n4

    msj_n5 db "Ingrese el quinto numero: "
	tam_n5 equ $ - msj_n5

    msj_orden db "El orden menor a mayor es: "
	tam_orden equ $ - msj_orden

	msj_res db "El mayor numero ingresado es: "
	tam_res equ $ - msj_res

    msj_res2 db "El menor numero ingresado es: "
	tam_res2 equ $ - msj_res2

section .bss
    n1 resb 1
	n2 resb 1
	n3 resb 1
    n4 resb 1
    n5 resb 1
	res resb 1
    opcion resb 1

section .text
    global _start

_start:
	;Mostrar por consola el mensaje de menu
	imprimir msj_menu,tam_menu
	leer opcion,2

	;Almacenar en un registro la opcion ingresada
	mov ah,[opcion]
	sub ah,'0'

	;Comparar la opcion y mostrar el mensaje
	cmp ah,1
	je principal

	cmp ah,2
	je ciclo

    cmp ah, 3
    je ordenar

	;**************NUMERO MENOR* *****************************
principal:

    ;Imprimir 5 numeros
	imprimir msj_n1,tam_n1
	leer n1,2

	imprimir msj_n2,tam_n2
	leer n2,2

	imprimir msj_n3,tam_n3
	leer n3,2

    imprimir msj_n4,tam_n4
	leer n4,2

    imprimir msj_n5,tam_n5
	leer n5,2

    ;Mover los numeros a registros 
	mov al,[n1]
	mov bl,[n2]
	mov cl,[n3]
    mov dl,[n4]
    mov ah,[n5]

	;Convertir los valores ingresados a numeros enteros
	sub al,'0'
	sub bl,'0'
	sub cl,'0'
    sub dl,'0'
    sub ah, '0'


    cmp al, bl
    jng print
    jg n2_menor 
    

print:
    ;dec cl
    push eax
    add al, '0'
    mov [n1], al
    ;escribir n, 1
    ;escribir espacio, 1
    pop eax
    jmp menor

n2_menor:
    cmp bl, cl
    jng print_menor
    jg n3_menor

n3_menor:
    cmp cl, dl
    jng print_menor_cl
    jg n4_menor


n4_menor:
    cmp dl, ah
    jng n4_menor_todos
    jg n5_menor
    
n5_menor:
    push eax
    add ah, '0'
    mov [n5], ah
    imprimir msj_res2,tam_res2
 	imprimir n5,1
    pop eax
    jmp salir

n4_menor_todos:
    push edx
    add dl, '0'
    mov [n4], dl
    imprimir msj_res2,tam_res2
 	imprimir n4,1
    pop edx
    jmp salir


print_menor_cl:
    push ecx
    add cl, '0'
    mov [n3], cl
    imprimir msj_res2,tam_res2
 	imprimir n3,1
    pop ecx
    jmp salir

print_menor:
    push ebx
    add bl, '0'
    mov [n2], bl
    ;escribir n, 1
    ;escribir espacio, 1
    pop ebx
    jmp menor_bl

menor_bl:
    cmp bl, dl
    jng n2_print_menor_bl
    jg n4_menor

n2_print_menor_bl:
    push ebx
    add bl, '0'
    mov [n2], bl
    imprimir msj_res2,tam_res2
 	imprimir n2,1
    pop ebx
    jmp salir 

menor: 
    cmp al, cl
    jng print2
    jg n3_menor

print2:
    ;dec cl
    push eax
    add al, '0'
    mov [n1], al
    ;escribir n, 1
    ;escribir espacio, 1
    pop eax
    jmp menor2

menor2: 
    cmp al, dl
    jng n1_m
    jg n4_menor


n1_m:
    push eax
 	add al,'0'
 	mov [n1],al 	
    pop eax
 	jmp menor_al

menor_al:
    cmp al, ah
    jng n1MenorTodos
    jg n5_menor

n1MenorTodos:
    push eax
 	add al,'0'
 	mov [n1],al
 	imprimir msj_res2,tam_res2
 	imprimir n1,1
    pop eax
 	jmp salir 




;****************MAYORES*****************************


ciclo:

    ;Imprimir 5 numeros
	imprimir msj_n1,tam_n1
	leer n1,2

	imprimir msj_n2,tam_n2
	leer n2,2

	imprimir msj_n3,tam_n3
	leer n3,2

    imprimir msj_n4,tam_n4
	leer n4,2

    imprimir msj_n5,tam_n5
	leer n5,2

    ;Mover los numeros a registros 
	mov al,[n1]
	mov bl,[n2]
	mov cl,[n3]
    mov dl,[n4]
    mov ah, [n5]

	;Convertir los valores ingresados a numeros enteros
	sub al,'0'
	sub bl,'0'
	sub cl,'0'
    sub dl,'0'
    sub ah, '0'


    cmp al, bl
    jg printt
    jng n2_menorr 
    

printt:
    ;dec cl
    push eax
    add al, '0'
    mov [n1], al
    ;escribir n, 1
    ;escribir espacio, 1
    pop eax
    jmp menorr

n2_menorr:
    cmp bl, cl
    jg print_menorr
    jng n3_menorr

n3_menorr:
    cmp cl, dl
    jg print_menor_cll
    jng n4_menorr



n4_menorr:
    cmp dl, ah
    jg n4_menor_todoss
    jng n5_menorr
    
n5_menorr:
    push eax
    add ah, '0'
    mov [n5], ah
    imprimir msj_res,tam_res
 	imprimir n5,1
    pop eax
    jmp salir

n4_menor_todoss:
    push edx
    add dl, '0'
    mov [n4], dl
    imprimir msj_res,tam_res
 	imprimir n4,1
    pop edx
    jmp salir

print_menor_cll:
    push ecx
    add cl, '0'
    mov [n3], cl
    ;escribir n, 1
    ;escribir espacio, 1
    pop ecx
    jmp n3_menor_todoss

n3_menor_todoss:
    push ecx
    add cl, '0'
    mov [n3], cl
    imprimir msj_res,tam_res
 	imprimir n3,1
    pop ecx
    jmp salir

print_menorr:
    push ebx
    add bl, '0'
    mov [n2], bl
    ;escribir n, 1
    ;escribir espacio, 1
    pop ebx
    jmp menor_bll

menor_bll:
    cmp bl, dl
    jg n2_print_menor_bll
    jng n4_menorr

n2_print_menor_bll:
    push ebx
    add bl, '0'
    mov [n2], bl
    imprimir msj_res,tam_res
 	imprimir n2,1
    pop ebx
    jmp salir 

menorr: 
    cmp al, cl
    jg print22

print22:
    ;dec cl
    push eax
    add al, '0'
    mov [n1], al
    ;escribir n, 1
    ;escribir espacio, 1
    pop eax
    jmp menor22

menor22: 
    cmp al, dl
    jg n1_men
    jng n4_menorr

n1_men:
    push eax
 	add al,'0'
 	mov [n1],al 	
    pop eax
 	jmp menor_all 

menor_all:
    cmp al, ah
    jg n1MenorTodoss
    jng n5_menorr

n1MenorTodoss:
    push eax
 	add al,'0'
 	mov [n1],al
 	imprimir msj_res,tam_res
 	imprimir n1,1
    pop eax
 	jmp salir 

;**************ORDENAR***************************
ordenar:

    ;Imprimir 5 numeros
	imprimir msj_n1,tam_n1
	leer n1,2

	imprimir msj_n2,tam_n2
	leer n2,2

	imprimir msj_n3,tam_n3
	leer n3,2

    imprimir msj_n4,tam_n4
	leer n4,2

    imprimir msj_n5,tam_n5
	leer n5,2

    ;Mover los numeros a registros 
	mov al,[n1]
	mov bl,[n2]
	mov cl,[n3]
    mov dl,[n4]
    mov ah,[n5]

	;Convertir los valores ingresados a numeros enteros
	sub al,'0'
	sub bl,'0'
	sub cl,'0'
    sub dl,'0'
    sub ah, '0'


    cmp al, bl
    jng pprint
    jg nn2_menor 
    

pprint:
    ;dec cl
    push eax
    add al, '0'
    mov [n1], al
    pop eax
    jmp mmenor

nn2_menor:
    cmp bl, cl
    jng pprint_menor
    jg nn3_menor

nn3_menor:
    cmp cl, dl
    jng pprint_menor_cl
    jg nn4_menor


nn4_menor:
    cmp dl, ah
    jng nn4_menor_todos
    jg nn5_menor
    
nn5_menor:
    push eax
    add ah, '0'
    mov [n5], ah
    ;imprimir msj_res2,tam_res2
 	imprimir n5,1
    pop eax
    jmp salir

nn4_menor_todos:
    push edx
    add dl, '0'
    mov [n4], dl
    ;imprimir msj_res2,tam_res2
 	imprimir n4,1
    pop edx
    jmp salir


pprint_menor_cl:
    push ecx
    add cl, '0'
    mov [n3], cl
    imprimir msj_res2,tam_res2
 	imprimir n3,1
    pop ecx
    jmp n4_menor

pprint_menor:
    push ebx
    add bl, '0'
    mov [n2], bl
    pop ebx
    jmp mmenor_bl

mmenor_bl:
    cmp bl, dl
    jng nn2_print_menor_bl
    jg nn4_menor

nn2_print_menor_bl:
    push ebx
    add bl, '0'
    mov [n2], bl
    ;imprimir msj_res2,tam_res2
 	imprimir n2,1
    pop ebx
    jmp nn3_menor 

mmenor: 
    cmp al, cl
    jng pprint2
    jg nn3_menor

pprint2:
    ;dec cl
    push eax
    add al, '0'
    mov [n1], al
    pop eax
    jmp mmenor2

mmenor2: 
    cmp al, dl
    jng nn1MenorTodos
    jg nn4_menor

nn1MenorTodos:
    push eax
 	add al,'0'
 	mov [n1],al
 	;imprimir msj_res2,tam_res2
 	imprimir n1,1
    pop eax
 	jmp nn2_menor 









salir:
    mov eax, 1
    int 80h


