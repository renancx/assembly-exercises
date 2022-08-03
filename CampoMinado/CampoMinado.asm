#Integrantes: João Vitor Betiatto & Renan Carlos Loewenstein 

		.data
campo:			.space		576   # esta versão suporta campo de até 12 x 12 posições de memória
salva_S0:		.word		0
salva_ra:		.word		0
salva_ra1:		.word		0


		  


SelOito:  .string		"\n1) Selecionar tamanho 8x8"
SelDez:	  .string		"\n2) Selecionar tamanho 10x10"
SelDoze:  .string		"\n3) Selecionar tamanho 12x12"
Sair:	  .string		"\n4)sair \n"
erroo:    .string		"\nO número digitado é inválido\n"

jogada:   .string		"\n1) Para fazer uma jogada"
flag:	  .string               "\n2) Colocar Bandeira\n"

barra:	  .string		"#"
branco:	  .string		" "
linha:	  .string		"\n"

Nlinha:   .string		"\nInsira numero da linha:  "
Ncoluna:  .string               "Insira numero da coluna: "

 .text

main1:

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
	j main1
        
imprime:
	main:
	la 	a0, campo	# endereço inicial do campo
	add	a1, zero, s0	# quantidade de linhas do campo
	jal 	INSERE_BOMBA
	nop
	
	li a1,0
	li t0,0
	li t2,0
	li t1,0
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
	j menu_jogadas
	nop
	
menu_jogadas:
	
	la  a0, jogada
	li  a7, 4 
	ecall
	
	la  a0, flag
	li  a7, 4 
	ecall
	
	li a7, 5
    	ecall
    	
    	li a2,1
    	li a3,2
    	beq a0,a2,abrir
    	beq a0,a3,bandeira
    	
    	abrir:
    	
		la  a0,Nlinha
		li  a7, 4 
		ecall
		
		li a7, 5
    		ecall
    	
    		li t1,0
    		add t1,t1,a0
    	    	
    		la  a0,Ncoluna
		li  a7, 4 
		ecall
	
		li a7, 5
    		ecall
    	
    		li t2,0
    		add t2,t2,a0
    		
    		j imprime
    	
    	
    	bandeira:
    	
   		la  a0,Nlinha
		li  a7, 4 
		ecall
		
		li a7, 5
    		ecall
    	
    		li t1,0
    		add t1,t1,a0
    	
    	
    		la  a0,Ncoluna
		li  a7, 4 
		ecall
	
		li a7, 5
    		ecall
    	
    		li t2,0
    		add t2,t2,a0
    		
    		j imprime
    	

#-------------------------------------------------------------------------------------------------------------------------

INSERE_BOMBA:
		la	t0, salva_S0
		sw  	s0, 0 (t0)		# salva conteudo de s0 na memoria
		la	t0, salva_ra
		sw  	ra, 0 (t0)		# salva conteudo de ra na memoria
		
		add 	t0, zero, a0		# salva a0 em t0 - endereço da matriz campo
		add 	t1, zero, a1		# salva a1 em t1 - quantidade de linhas 

QTD_BOMBAS:
		addi 	t2, zero, 1 		# seta para 15 bombas	
		add 	t3, zero, zero 	# inicia contador de bombas com 0
		addi 	a7, zero, 30 		# ecall 30 pega o tempo do sistema em milisegundos (usado como semente
		ecall 				
		add 	a1, zero, a0		# coloca a semente em a1
INICIO_LACO:
		beq 	t2, t3, FIM_LACO
		add 	a0, zero, t1 		# carrega limite para %	(resto da divisão)
		jal 	PSEUDO_RAND
		add 	t4, zero, a0		# pega linha sorteada e coloca em t4
		add 	a0, zero, t1 		# carrega limite para % (resto da divisão)
   		jal 	PSEUDO_RAND
		add 	t5, zero, a0		# pega coluna sorteada e coloca em t5

###############################################################################
# imprime valores na tela (para debug somente) - retirar comentarios para ver
#	
#		li	a7, 4		# mostra texto "Posicao: "
#		la	a0, posicao
#		ecall
#		
#		li	a7, 1		
#		add 	a0, zero, t3 	# imprime quantidade ja sorteada
#		ecall		
#
#		li	a7, 4		# imrpime :
#		la	a0, dois_pontos
#		ecall
#
#		li	a7, 1
#		add 	a0, zero, t4 	# imprime a linha sorteada	
#		ecall
#		
#		li	a7, 4		# imrpime espaço
#		la	a0, espaco
#		ecall	
#			
#		li	a7, 1
#		add 	a0, zero, t5 	# imprime coluna sorteada
#		ecall
#		
##########################################################################	

LE_POSICAO:	
		mul  	t4, t4, t1
		add  	t4, t4, t5  		# calcula (L * tam) + C
		add  	t4, t4, t4  		# multiplica por 2
		add  	t4, t4, t4  		# multiplica por 4
		add  	t4, t4, t0  		# calcula Base + deslocamento
		lw   	t5, 0(t4)   		# Le posicao de memoria LxC
VERIFICA_BOMBA:		
		addi 	t6, zero, 9		# se posição sorteada já possui bomba
		beq  	t5, t6, PULA_ATRIB	# pula atribuição 
		sw   	t6, 0(t4)		# senão coloca 9 (bomba) na posição
		addi 	t3, t3, 1		# incrementa quantidade de bombas sorteadas
PULA_ATRIB:
		j	INICIO_LACO

FIM_LACO:					# recupera registradores salvos
		la	t0, salva_S0
		lw  	s0, 0(t0)		# recupera conteudo de s0 da memória
		la	t0, salva_ra
		lw  	ra, 0(t0)		# recupera conteudo de ra da memória		
		jr 	ra			# retorna para funcao que fez a chamada
		
##################################################################
# PSEUDO_RAND
# função que gera um número pseudo-randomico que será
# usado para obter a posição da linha e coluna na matriz
# entrada: a0 valor máximo do resultado menos 1 
#             (exemplo: a0 = 8 resultado entre 0 e 7)
#          a1 para o número pseudo randomico 
# saida: a0 valor pseudo randomico gerado
#################################################################
#int rand1(int lim, int semente) {
#  static long a = semente; 
#  a = (a * 125) % 2796203; 
#  return (|a % lim|); 
# }  

PSEUDO_RAND:
		addi t6, zero, 125  		# carrega constante t6 = 125
		lui  t5, 682			# carrega constante t5 = 2796203
		addi t5, t5, 1697 		# 
		addi t5, t5, 1034 		# 	
		mul  a1, a1, t6			# a = a * 125
		rem  a1, a1, t5			# a = a % 2796203
		rem  a0, a1, a0			# a % lim
		bge  a0, zero, EH_POSITIVO  	# testa se valor eh positivo
		addi s2, zero, -1           	# caso não 
		mul  a0, a0, s2		    	# transforma em positivo
EH_POSITIVO:	
		ret				# retorna em a0 o valor obtido
		
		