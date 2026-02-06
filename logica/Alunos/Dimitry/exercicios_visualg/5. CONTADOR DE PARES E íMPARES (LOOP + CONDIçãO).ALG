Algoritmo "5. Contador de pares e ímpares (loop + condição)"
// Disciplina   : [Linguagem e Lógica de Programação] 
// Professor   : Antonio Carlos Nicolodi 
// Leia 20 números e conte quantos são pares e quantos são ímpares. Mostre também a soma dos pares e a soma dos ímpares.
Var
   par, impar, i, n: inteiro

Inicio

i <- 1
par <- 0
impar <- 0

enquanto i <= 20 faca
   escreva("Digite um número: ")
   leia(n)

   se n mod 2 = 0 entao
      par <- par + 1
   senao
      impar <- impar + 1
   fimse

   i <- i + 1
fimenquanto

escreval("Total de pares: ", par)
escreval("Total de ímpares: ", impar)

Fimalgoritmo