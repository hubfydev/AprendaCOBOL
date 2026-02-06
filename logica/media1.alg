// Secao de Identificacao:
// Funcao: Testar aprovacao de aluno se a media for igual ao maior que 6.
// Autor: Andre Costa
// Data: 01/26/2026
algoritmo "media1"


// Sessao de Declaracoes
var
// Cria as variaveis
nota1, nota2: inteiro
media: real
inicio
// Secao de Comandos

escreval("   APROVACAO DE ALUNOS    ")
escreval()

//pede a nota 1
escreva("Informe a primeira nota: ")
leia(nota1)

//pede a nota 2
escreval()
escreva("Informe a segunda nota: ")
leia(nota2)

escreval()
escreval()

//calcula a media
media <- (nota1 + nota2)/2

//testa o resultado
se (media >= 6) entao
   escreval("Aluno aprovado com media ", media)
senao
   escreval("Aluno reprovado com media ", media)
fimse

fimalgoritmo
