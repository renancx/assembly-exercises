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
SelDoze:  .string		"\n3) Selecionar tamanho 12x12\n"
barra:	  .string		"|"
branco:	  .string		" "
linha:	  .string		"\n"

 .text

main:

        li s1, 1
        li s2,2
        li s3,3
	la  a0, SelOito
	li  a7, 4 
	ecall
	la  a0, SelDez
	li  a7, 4 
	ecall
	la  a0, SelDoze
	li  a7, 4 
	ecall
	
	li a7, 5
    	ecall
        
        beq a0,s1,mostraOito
    	beq a0,s2,mostraDez
    	beq a0,s3,mostraDoze
    	
mostraOito:
	addi a1,a1,8 #quando vai parar(linha e coluna)
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

mostraDez:
	addi a1,a1,10 #quando vai parar(linha e coluna)
	inicio10:
	addi t2,t2,0
	addi t0,t2,0
	la  a0, linha
	li  a7, 4 
	ecall
	loop10: #imprime linha
		beq a1,t0,loop210
		la  a0, barra
		li  a7, 4 
		ecall
	
		la  a0, branco
		li  a7, 4 
		ecall
		addi t0,t0,1
		
		j loop10
	loop210:
		addi t1,t1,1
		beq t1,a1,end
		j inicio10
		
mostraDoze:
	addi a1,a1,12 #quando vai parar(linha e coluna)
	inicio12:
	addi t2,t2,0
	addi t0,t2,0
	la  a0, linha
	li  a7, 4 
	ecall
	loop12: #imprime linha
		beq a1,t0,loop212
		la  a0, barra
		li  a7, 4 
		ecall
	
		la  a0, branco
		li  a7, 4 
		ecall
		addi t0,t0,1
		
		j loop12
	loop212:
		addi t1,t1,1
		beq t1,a1,end
		j inicio12
		
end: 
	nop