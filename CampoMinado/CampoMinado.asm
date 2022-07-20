#Integrantes: João Vitor Betiatto & Renan Carlos Loewenstein 

	.data
	
OitoPorOito:                    # matriz 8x8 que será vista pelo usuario
	.word   -1,-1,-1,-1,-1,-1,-1,-1
	.word   -1,-1,-1,-1,-1,-1,-1,-1
	.word   -1,-1,-1,-1,-1,-1,-1,-1
	.word   -1,-1,-1,-1,-1,-1,-1,-1
	.word   -1,-1,-1,-1,-1,-1,-1,-1
	.word   -1,-1,-1,-1,-1,-1,-1,-1
	.word   -1,-1,-1,-1,-1,-1,-1,-1
	.word   -1,-1,-1,-1,-1,-1,-1,-1
	.word   -1,-1,-1,-1,-1,-1,-1,-1
	
DezPorDez:                    # matriz 10x10 que será vista
	.word   -1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	.word   -1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	.word   -1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	.word   -1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	.word   -1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	.word   -1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	.word   -1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	.word   -1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	.word   -1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	.word   -1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	.word   -1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	
DozePorDoze:                    # matriz 12x12 que será vista

	.word   -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	.word   -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	.word   -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	.word   -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	.word   -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	.word   -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	.word   -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	.word   -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	.word   -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	.word   -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	.word   -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	.word   -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	.word   -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
		  


SelOito:  .string		"\n1) Selecionar tamanho 8x8"
SelDez:	  .string		"\n2) Selecionar tamanho 10x10"
SelDoze:  .string		"\n3) Selecionar tamanho 12x12"
Sair:	  .string		"\n4)sair \n"
barra:	  .string		"-"
branco:	  .string		" "
linha:	  .string		"\n"
erroo:    .string		"\nerrrrrrrrrrooooou coloca certo panaca \n"

 .text

main:

	li a2,1
	li a3,2
	li a4,3
	li a5,4

        la  a0, SelOito
	li  a7, 4 
	ecall
	la  a0, SelDez
	li  a7, 4 
	ecall
	la  a0, SelDoze
	li  a7, 4 
	ecall
	la  a0, Sair
	li  a7, 4 
	ecall
	
	li a7, 5
    	ecall
    	
    	beq a0,a2,somaoito
    	beq a0,a3,somadez
    	beq a0,a4,somadoze
    	beq a0,a5,end

		                                                                
        li s2,3
        li s1,1
        li s3,7
        li s3,8
        
        bgt a0,s2,erro
        blt a0,s1,erro
        beq a0,s3,erro
        beq a0,s4,erro
        

somaoito:
	li s0,8
	j imprime

somadez:
	li s0,10
	j imprime
	
somadoze:
	li s0,12
        j imprime

erro: 

	la a0, erroo	# Carrega a mensagem errobandeira, que indica que não é possível colocar uma bandeira na posição desejada
	li a7, 4		# Imprime a mensagem
	ecall
	j main
        
imprime:
	add a1,a1,s0 #quando vai parar(linha e coluna)
	inicio8:
	addi t2,t2,0
	addi t0,t2,0
	la  a0, linha
	li  a7, 4 
	ecall
	loop8: #imprime linha
		beq a1,t0,loop28
		la  a0, barra
		li  a7, 4 
		ecall
	
		la  a0, branco
		li  a7, 4 
		ecall
		addi t0,t0,1
		
		j loop8
	loop28:
		addi t1,t1,1
		beq t1,a1,end
		j inicio8

end: 
	nop
