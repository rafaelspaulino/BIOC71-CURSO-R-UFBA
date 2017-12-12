
######################################################
# Introdução Linguagem R
# Vitor Passos Rios
# Universidade Federal da Bahia
# https://github.com/vrios/Intro-Linguagem-R/wiki
#####################################################

#####Usando o R como calculadora#####

#Digite no R os códigos abaixo.
#Dica: escreva neste arquivo, ao lado do comando, o que ele faz,
#como no exemplo abaixo

1 + 1 #soma dos valores

# O símbolo # representa um comentário, isto é, tudo que vier à direita
# dele será ignorado quando o R ler o arquivo

34 - 72.3 ##subtração entre os valores

# use pontos como separador de decimal. O que acontece se você usar virgula?
78 / 3 #divisão entre os números, 78 por 3
2 ^ 3 #potência, 2 elevado a 3 
3 * 2 #multiplicação
sqrt(2) #raiz quadrada
pi #valor de pi - 3,14
log(x = 3,base = 10) ##logaritimo com base 10
exp(x = 1) #exponencial de 1
#o que querem dizer estes valores dentro do parêntese? porque usamos o = aqui?
## os valores são os quais é feito a matematica em cima deles.

#####Atribuição de valores e criação de objetos#####
#O que os comandos abaixo fazem?
##definem os objetos a serem lidos pelo R
objeto1=3 ##este objeto apresenta valor 3
objeto1 ##leitura do objeto, reconhecendo-o como 3
objeto = 42 ##este objeto apresenta valor 42
objeto ##leitura do objeto, reconhecendo-o como 42
objeto.2 <- 42 #mesma coisa dos comandos acima, porém com símbolo diferente que representa mesma coisa
objeto.2
# Os símbolos = e <- fazem basicamente a mesma coisa. Que coisa?
##simbolos representam igual, ambos tem a mesma função.

objeto.cubico <- objeto^3 #o objeto.cubico será o valor do objeto elevado a 3
resultado.1 <- (objeto.cubico / 3) + 7 #resultado.1 é igual o valor da linha de cima
objeto.texto <- "texto sempre vem entre aspas"
objeto.texto ##leu que o objeto.texo é o texto sempre vem entre aspas
objeto.texto.2 <- "42" #neste caso o 42 está sendo lido como texto

objeto.vetor.1 = 1:34 #reconhecimento de que este novo objeto tem 34 valores
objeto.vetor.1 #leu os valores do novo objeto
objeto.vetor2 = c(1, 74.5, 48) ##este obejeto gera vetores em conjunto
objeto.vetor2 ##leu os vetores gerado por c

"adicionei por causa do github"

?seq #gerar sequencias
objeto.vetor3 = seq(from = 20, to = 32, by = 0.5) #novo objeto sequenciado de 20 a 32, separado em 0.5

#podemos calcular estatísticas com o r
mean(objeto.vetor3) #media
var(objeto.vetor3) #variancia
median(objeto.vetor3) #mediana
min(objeto.vetor3)
max(objeto.vetor3)
diff(objeto.vetor3) #calcula a diferença entre os elementos sucessivos do vetor

"mais uma adicao por causa do github"

# R também faz comparações entre objetos
42 > 7 ##um valor é maior que outro
objeto == objeto.2 #igualdade entre os valores, se objeto é igual ao objeto.2
objeto == objeto.texto.2 ##SIM, os objetos são iguais.. não usar para testes
# o que aconteceu acima?
## os objetos criados são iguais e ele reconheceu isso com TRUE

7.1 <= 7.001  ## um valor é menor que outro
?"<"

#pedindo ajuda
?pi #uma constante, valor 3,14...
?log ##função logaritimica
??lm ##função modelo linear - regressão linear
help(log) ##função logaritimica
help.search("anova") ##help.search é uma função que busca tudo relacionado ao termo entre "", como se fossem a dupla interrogação



####Arquivos e diretórios#####
# Como você descobre o diretório de trabalho?
##getwd()
getwd()
# Como você lista o conteúdo do diretório de trabalho?
##ls
ls()

# Como você define o diretório de trabalho?
##setwd (diretorio)
setwd()

# Como você carrega um arquivo de script?
##source(teste.r)
source(teste.r)
# Como você salva os objetos que criou? 
##save()
save()

# Como você carrega os objetos que criou?
##print
print(objeto.2) ##exemplo de um objeto ja criado

# Como ver quis objetos estão na sua área de trabalho?
## ls() este comando mostra todos objetos da área de trabalho do R
ls()

# Como remover objetos da área de trabalho?
##rm()
rm("vetor1") ##pode-se selecionar o objeto a ser excluido

##### Lidando com erros#####
# O que acontece quando você digita os comandos abaixo? Como consertar cada erro?
objetol ##este objeto não existe.. não foi encontrado
objeto .texto ##objeto nao existe, provavelmente por erro de digitação
Objeto ##objeto não encontrado
source("chuchu.R") #arquivo nao econtrado no diretorio de trabalho
source(chuchu.R) ## este objeto nao existe
setwd("C:/CavernaDoDragão") ##erro de definição no diretorio de trabalho, nao existe CavernaDoDragao
getwd ##exibe as funçoes detalhadas
Getwd() ##funcao escrita de forma errada - A letra g deve ser minuscula
#dica: quando o R der erro, copie e cole a mensagem de erro no google


"git hub"
"git hub 2"