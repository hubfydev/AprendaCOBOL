Algoritmo "3. Somatório de 1 até N (loop + cálculo)"
// Leia um número inteiro N e calcule a soma 1 + 2 + 3 + ... + N. Mostre o resultado.
Var
n: inteiro
i: inteiro
soma: inteiro
aux: inteiro

Inicio
i <- 1
escreva("Digite um número: ")
leia(n)

enquanto i < (n + 1) faca
         escreva(soma, " + ")
         soma <- i + soma
         escreval(i, " = ", soma)
         i <- i + 1

fimenquanto

escreval("A soma de 1 para ", n, " é de ", soma)



Fimalgoritmo