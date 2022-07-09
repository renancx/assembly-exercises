#Renan Carlos Loewenstein
	.data
vetor1:	.word	9, 8, 7, 6, 5, 4, 3, 2, 1

	.text
	
main:
	la 	a0, vetor1
	li 	a1, 8
	li 	a2, 0
	jal	swap

	li 	a7, 10   # chamada de sistema para encerrar programa
	ecall

#####################################
# Implemente a função abaixo
swap:
#da posicao a0
add t0,a1,a1
add t0,t0,t0
add t1,a0,t0
lw s0,0(t1)

#da posicao a1
add t2,a2,a2
add t2,t2,t2
add t3,a0,t2
lw s1, 0(t3)

sw s1,0(t1)
sw s0,0(t3)
ret
