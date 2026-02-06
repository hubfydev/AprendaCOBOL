Algoritmo "10. Matriz soma da diagonal e média (matriz + loop)"
// Leia uma matriz 3x3 de inteiros e mostre: soma da diagonal principal, soma da diagonal secundária e média de todos os elementos.
Var
m: vetor[1..3, 1..3] de inteiro
i, j: inteiro
somaPrincipal, somaSecundaria, somaTotal: inteiro
media: real

inicio
somaPrincipal <- 0
somaSecundaria <- 0
somaTotal <- 0

para i de 1 ate 3 faca
     para j de 1 ate 3 faca
          escreva("Digite o valor para a posição [", i, ",", j, "]: ")
          leia(m[i, j])
          somaTotal <- somaTotal + m[i, j]
     fimpara
fimpara
  
para i de 1 ate 3 faca
     somaPrincipal <- somaPrincipal + m[i, i]
     somaSecundaria <- somaSecundaria + m[i, 4 - i]
fimpara
  
media <- somaTotal / 9
escreval("")

escreval("Matriz Original")
para i de 1 ate 3 faca
     para j de 1 ate 3 faca
          escreva(m[i, j], " ")
     fimpara
escreval
fimpara
escreval("")
escreval("Soma da diagonal principal: ", somaPrincipal)
escreval("Soma da diagonal secundaria: ", somaSecundaria)
escreval("Media: ", media)

fimalgoritmo