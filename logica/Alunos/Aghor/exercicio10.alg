// Função : Ler uma matriz 3x3 e exibir a soma da diagonal principal, a soma da diagonal secundária e a média entre todos os elementos do vetor
// Autor : Ághor Murilo dos Santos
// Data : 19/01/2026
algoritmo "Exercicio10"

// Seção de Declarações 
var
matriz : vetor[1..3,1..3] de inteiro // Matriz 3x3 de inteiros
i, j, diagonalP, diagonalS : inteiro // Índices e variáveis de controle
media : real                         // Variável de calculo da média

// Seção de Comandos
inicio
// Inicia a variável
media <- 0
// Looping do valor de coluna da matriz
para i de 1 ate 3 faca
     limpatela()
     // Looping do valor de linha da matriz
     para j de 1 ate 3 faca
          // Requisita e grava o input do usuário no respectivo endereço da matriz
          escreval("Digite um valor inteiro para a linha",j," da coluna",i,":")
          leia(matriz[i,j])
          // Soma valores de entrada para calculo posterior
          media <- media + matriz[i,j]
          escreval
     fimpara
fimpara

// Calcula a média entre todos os elementos da matriz
media <- media / 9
// Calcula a soma da diagonal principal da matriz
diagonalP <- matriz[1,1] + matriz[2,2] + matriz[3,3]
// Calcula a soma da diagonal secundária da matriz
diagonalS <- matriz[1,3] + matriz[2,2] + matriz[3,1]

limpatela()
// Exibe os dados processados
escreval("Soma da diagonal principal:",diagonalP)
escreval("Soma da diagonal secundária:",diagonalS)
escreval("Média de todos os elementos da matriz:",media)



fimalgoritmo
