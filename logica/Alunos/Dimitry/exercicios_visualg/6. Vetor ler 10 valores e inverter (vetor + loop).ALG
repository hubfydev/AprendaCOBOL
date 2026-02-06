Algoritmo "6. Vetor ler 10 valores e inverter (vetor + loop)"
// Disciplina   : [Linguagem e Lógica de Programação] 
// Professor   : Antonio Carlos Nicolodi 
// Leia 10 números em um vetor e depois mostre os valores na ordem inversa.
Var
   v: vetor[1..10] de inteiro
   i: inteiro

Inicio


para i de 1 ate 10 faca
     escreva("Digite o valor ", i, ": ")
     leia(v[i])
fimpara

escreval()
escreval("Valores na ordem inversa:")


para i de 10 ate 1 passo -1 faca
     escreva(v[i], " ")
fimpara

Fimalgoritmo