Algoritmo "8. Vetor separar positivos e negativos (vetor + loop)"
// Leia 12 números em um vetor. Gere dois novos vetores: um com os positivos (e zero) e outro com os negativos. Mostre os dois no final.
Var
list, listPosi, listNeg: vetor[1..12] de inteiro
i, n: inteiro

Inicio
i <- 1
n <- 0
enquanto i <= 12 faca
         list[i] <- n
         i <- i + 1
         n <- n + 1
fimenquanto

escreval("lista original: ")
i <- 1
enquanto i <= 12 faca
         escreva(list[i])
         i <- i + 1
fimenquanto

escreval("")

escreval("Números pares da lista: ")
i <- 1
enquanto i <= 12 faca
         se list[i] mod 2 = 0 entao
            escreva(list[i])
         fimse
         i <- i + 1
fimenquanto
escreval("")

escreval("Números ímpares da lista: ")
i <- 1
enquanto i <= 12 faca
         se list[i] mod 2 = 1 entao
            escreva(list[i])
         fimse
         i <- i + 1
fimenquanto

Fimalgoritmo