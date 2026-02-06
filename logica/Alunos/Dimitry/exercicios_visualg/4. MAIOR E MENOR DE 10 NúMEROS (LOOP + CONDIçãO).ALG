Algoritmo "4. Maior e menor de 10 números (loop + condição)"
// Leia 10 números e, ao final, mostre o maior, o menor e a média dos valores.
Var
i, n, maior, menor: inteiro

Inicio
i <- 1
escreva("Digite um número: ")
leia(n)
menor <- n
maior <- n

enquanto i < 10 faca
         escreva("Digite um número: ")
         leia(n)
         se n < menor entao
            menor <- n
         senao
              se n > maior entao
                 maior <- n
              fimse
         fimse
         i <- i + 1
fimenquanto

escreval("O maior número é: ", maior)
escreva("O menor númeor é: ", menor)



Fimalgoritmo