Algoritmo "9. Folha de pagamento simples (loop + cálculo)"
// Leia o número de funcionários Q. Para cada um, leia: nome, horas trabalhadas e valor da hora. Calcule e mostre o salário bruto de cada um. Ao final mostre: total da folha, maior salário e o nome do funcionário.
Var
qtd_func, i: inteiro
nome, maior_func: caractere
horas, val_hora, salario_bruto, maior, total_folha: real

Inicio
i <- 1
maior <- 0
total_folha <- 0
escreval("Digite o número de funcionários: ")
leia(qtd_func)
escreval("")

enquanto i <= qtd_func faca
         escreval("Digite o nome do funcionário: ")
         leia(nome)
         escreval("Digite as horas trabalhadas por mês: ")
         leia(horas)
         escreval("Digite o valor/hora: R$")
         leia(val_hora)
         salario_bruto <- (val_hora * horas)
         escreval(nome, " Recebe R$", salario_bruto, " por mês.")
         se salario_bruto > maior entao
            maior <- salario_bruto
            maior_func <- nome
         fimse
         
         total_folha <- total_folha + salario_bruto

         i <- i + 1
         escreval("")
fimenquanto

escreval("O funcionário ", maior_func, " é quem tem o maior salário, com um valor de R$", maior, " por mês.")
escreval("Total da folha: ")
escreva("R$"total_folha)
Fimalgoritmo