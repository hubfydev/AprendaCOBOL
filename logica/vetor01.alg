// Secao de Identificacao
// Funcao: Cria um vetor com numeros aleatorios de 1 a 80 para acuparem um
//         vetor de 20 posicoes. Apos, ele exibe o vetor criado mostrando
//         as 10 primeiras posicoes. Depois, ele mostra as mesmas 10 primeiras
//         posicoes deste vetor ordenadas de forma crescenete e tambem de
//         forma decrescente.
// Autor: Andre Costa
// Data: 1/16/2026
algoritmo "vetor01"


// Sessao de Declaracoes
var
// Cria o vetor chamado vet
vet: vetor[1..30] de inteiro
// cria as variaveis auxiliares de recursividade
i,j,aux, max, total: inteiro
// cria a variavel de controle da ordencao
ordenou: caractere
inicio
// Secao de Comandos

max   <- 10
total <- 5

//construindo o vetor
para i de 1 ate max passo 1 faca
   vet[i] <- randi(80)+1
fimpara

//leitura
escreval("Exibindo o vetor criado:")
para i de 1 ate max passo 1 faca
   escreva(vet[i]," | ")
fimpara

escreval()
escreval()

escreval("Corte das primeiras ", total, " posicoes: ")
para i de 1 ate total passo 1 faca
    escreva(vet[i]," | ")
    //escreval()
fimpara

para i de 1 ate total passo 1 faca //trocando duas posicoes
   ordenou <- "s"
   enquanto (ordenou = "s") faca
      ordenou <- "n"
      para j de 1 ate total -1 faca
         se (vet[j] > vet[j+1]) entao
            aux <- vet[j]
            vet[j] <- vet[j+1]
            vet[j+1] <- aux
            ordenou <- "s"
         fimse
      fimpara
   fimenquanto
fimpara

escreval()
escreval()

escreval("Vetor resultadnte crescente: ")
para i de 1 ate total passo 1 faca
    escreva(vet[i]," | ")
    //escreval()
fimpara

escreval()
escreval()

escreval("Vetor resutante decrescente: ")
para i de total ate 1 passo -1 faca
    escreva(vet[i]," | ")
    //escreval()
fimpara

escreval()
escreval()
escreval()

fimalgoritmo
