#Renan Carlos Loewenstein
	.data 
vetor1: .word -10, 8, 11, 16, 15, -6, 22 
	.text
main: 	
	la a0, vetor1
	li a1,7
	addi a3,a3,4
	add a4,a4,zero # "while i" do codigo em c
	add t1,t1,zero
	
	add t2,t1,a3
	add t1,a0,t1
	add t2,a0,t2
	
	lw s0,0(t1)
	lw s1,0(t2)
	
	blt s1,s0,menor
	
	addi a4,a4,1
	j ordena #jump para o loop
	
	li a7,10 # chamada de sistema para encerrar programa
	ecall

#####################################
# Implemente a função abaixo
ordena:
	addi a4,a4,1
	beq a4,a1,fim
	add t1,t1,a3
	add t2,t1,a3
	
	lw s0,0(t1)
	lw s1,0(t2)
	
	blt s1,s0,menor
	
	jal ordena

menor:
	add t4,t2,zero
	loop1:
		sub t4,t4,a3
		
		lw s2,0(t4)
		
		blt s1,s2, loop1 #faz o loop ate encontrar algo maior 
		bge s1,s2, swap
swap: 
	sub a6,t2,a3
	lw t5,0(a6)
	
	sw s0,0(t2)
	
	add t4,t4,a3
	lw s2,0(t4)
	
	sw s1,0(t4)

loop: #realiza o laco
        add t4,t4,a3		
	lw t6,0(t4)
	
	beq s2,s0,ordena

	sw s2,0(t4)
	
	add s2,t6,zero	#passa o valor de t6 para o s2	
	j loop
	
fim:
	nop
