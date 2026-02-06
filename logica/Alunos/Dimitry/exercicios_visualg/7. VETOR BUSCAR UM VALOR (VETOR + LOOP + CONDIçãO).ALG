Algoritmo "7. Vetor buscar um valor (vetor + loop + condição)"
// Disciplina   : [Linguagem e Lógica de Programação] 
// Professor   : Antonio Carlos Nicolodi 
// Leia 15 números em um vetor. Depois leia um número X e informe se X existe no vetor e em quais posições ele aparece (pode ter repetição).
Var
list: vetor[1..15] de inteiro
i, n: inteiro


Inicio
i <- 1


enquanto i <= 15 faca
         list[i] <- i
         i <- i + 1
fimenquanto

list[10] <- 7

escreva("Digite um número: ")
leia(n)

i <- 1
enquanto i <= 15 faca
         se list[i] = n entao
            escreval(n, " existe na posição: ", i)
         fimse
         i <- i + 1
fimenquanto

Fimalgoritmo