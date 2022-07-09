#Renan Carlos Loewenstein
	.data	
vetor1: .word 9, 8, 7, 6, 5, 4, 3, 2, 1
	.text

main: 
	la a0,vetor1
	li a1,8
	li a2,0	
	addi a3,a3,4
	
	jal shift
	
	li a7,10	#chamado de sistema para encerrar o programa
	ecall
shift:
	#achando o endereco do vetor
	add t0,a1,a1
	add t0,t0,t0
	#faz a soma
	add t1,a0,t0
	lw s0,0(t1)	
        add t2,a2,a2
        add t4,t2,t2
        add t3,a0,t4
        lw s1,0(t3)
        
        sw s0,0(t3)
        
        add t4,t4,a3
        add t2,a0,t4
        lw t5,0(t2)
        
        sw s1,0(t2)
        
	teste:	#faz o loop
        	add t4,t4,a3
		add t2,a0,t4
		
		lw t6,0(t2)
		beq t5,s0,end

		sw t5,0(t2)
		
		add t5,t6,zero
		j teste
end:
	ret