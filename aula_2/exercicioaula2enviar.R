##exercicio aula 2 notar
######################################################
# Introdução Linguagem R
# Vitor Passos Rios
# Universidade Federal da Bahia
# https://github.com/vrios/Intro-Linguagem-R/wiki
#####################################################

#quando possível, sua resposta deve ser um código do R

#####Trabalhando com dados#####
# o que é um dataframe? Qual a diferneça entre um dataframe e um list?
## dataframe é uma lista de trabaho gerado através do R, ele gera linhas e colunas em uma planilha


# o que as funções abaixo fazem? O que elas retornam?
is.vector() ## retorna TRUE se possuir atributos de vetor ou FALSE não possui atributos de vetor
is.numeric() ## cria objetos do tipo numerico. essa funçao é um teste geral de um objeto sendo interpretado por numeros
is.character() ## criar testes ou objetos do tipo caracter
is.matrix(peso) ## cria matrizes de um conjunto de valores dados
is.na() ##NA é um valor faltante nos dados
is.data.frame() ##funçao para checar se um objeto é um data.frame

##is � uma pergnta, ela da uma resposta ao que estou perguntando

#o que queremos dizer quando dizemos uma função "retorna" alguma coisa?
##ela mostra o resultado, funcao � um comando para o r, retornar � o r mostrando o resultado
###valor final q o r me deu

#o que a função summary() faz?
##sumario dos dados, por exemplo, média, desvio...estatistica sumaria do objeto que eu der

#Três áreas foram submetidas aplicação de três adubos diferentes, e uma foi
#mantida como controle. A biomassa seca (kg) por parcela foi medida para
#verificar se houve efeito do adubo. Os dados obtidos foram:

#(Controle)	A	37	34	36	42	31  33
#B	62	54	57	64	60
#C	63	58	60	62	61 44
#D	41	37	38	49	35 49
#Crie um dataframe com estes dados
A=c(37,34,36,42,31,33)
B=c(62,54,57,64,60)
C=c(63,58,60,62,61,44)
D=c(41,37,38,49,35,49)

tratamento=c(rep("A",6),rep ("B",5),rep("C",6),rep("D",6))
tratamento

biomassa=c(37,34,36,42,31,33,62,54,57,64,60,63,58,60,62,61,44,41,37,38,49,35,49)
biomassa

novo=data.frame(tratamento,biomassa)
novo

media.a=mean(novo$biomassa[novo$tratamento=="A"])
media.a
media.b=mean(novo$biomassa[novo$tratamento=="B"])
media.b
media.c=mean(novo$biomassa[novo$tratamento=="C"])
media.c
media.d=mean(novo$biomassa[novo$tratamento=="D"])
media.d

#Calcule a média de cada tipo de adubo, sem usar summary(), usando o dataframe
#que você criou acima
media.a=mean(novo$biomassa[novo$tratamento=="A"])
media.a
media.b=mean(novo$biomassa[novo$tratamento=="B"])
media.b
media.c=mean(novo$biomassa[novo$tratamento=="C"])
media.c
media.d=mean(novo$biomassa[novo$tratamento=="D"])
media.d



#que problemas você teve ao fazer o exercício acima?
##nenhum,mentira kkk, dificuldades para elabora o data.frame, mas no final deu certo.

# O que a função unique() faz?
## retorna valores unicos do vetor, ignora valores repetidos
##tudo que ocorre ignoando as repeti��es, tudo que ocorre pelo menos umas vez, ela retona


#Usando o conjunto de dados caixeta.csv, disponivel em
#http://ecologia.ib.usp.br/bie5782/doku.php?id=dados:dados-caixeta, calcule
#quantas espécies estão presentes na coluna especie. Para ler o arquivo, execute
#o código abaixo
caixeta = read.table("caixeta.csv", header=T, sep=",", as.is=T)
summary(caixeta)
sp=(caixeta$especie)
unique(sp)

# o arquivo deve estar no seu diretório de trabalho
str(caixeta) #o que este comando faz? mostra a estrutura dos arquivos
summary(caixeta)

#podemos criar uma coluna a mais no nosso dataframe apenas dizendo ao R o que
#colocar lá. Por exemplo, criamos uma coluna com o nome do coletor do dado
caixeta$coletor= "Darwin" #regra da reciclagem
str(caixeta)

#agora adicione no objeto caixeta uma coluna chamada "desvio" com o quanto a
#altura de cada árvore difere da média de todas as árvores
media.arvores=mean (caixeta$h)
media.arvores
desvio.h= caixeta$h - media.arvores
desvio.h
caixeta$desvio =desvio.h
caixeta


#Usando a função table(), conte quantos indivíduos de cada espécie existem
table(caixeta$especie)


#A função table() também pode contar por espécie em cada local, depois por local
#em cada espécie). Como? 
table(caixeta$especie, caixeta$local)

caixeta
#crie um objeto chamado pequenas que contenha todas as árvores com altura (h)
#menor que um metro.(Os dados no arquivo estão em centímetros)
pequenas=caixeta[caixeta$h<100, ]
pequenas

#crie um objeto chamado grandes que contenha todas as árvores acima de 3 metros
grandes=caixeta [caixeta$h>300, ]
grandes

#crie um objeto chamado medias que todas as árvores com alturas entre um metro e
#tres metros
medias = caixeta [caixeta$h>=100 & caixeta$h<=300, ]
medias

#agora em uma linha de comando, crie um objeto que contenha a quantidade de
#árvores pequenas, médias e grandes, separadamente

todas = c(length(pequenas$h),length(medias$h),length(grandes$h))
todas                             
dim (pequenas)
a=0

#Crie um objeto chamado obj somente com os individuos de "Alchornea
#triplinervia" Em quantas localidades esta espécie ocorre? Qual comando para
#encontrar essa informação?

obj = caixeta[caixeta$especie=="Alchornea triplinervia", ]
obj
table(obj$local) ##isso vitor fez em sala

##a esp�cie ocorre em duas localidade, jureia e retiro

#podemos remover dados de um dataframe, usando o sinal de menos

caixeta.sem.tabebuia = caixeta[ - which(caixeta$especie=="Tabebuia cassinoides"),]
sort (unique(caixeta.sem.tabebuia$especie))

#agora crie um objeto removendo todas as "Tabebuia cassinoides" do local retiro
#(somente do local retiro)tiro
caixeta.sem.retiro=caixeta[!c(caixeta$local=="retiro" & caixeta$especie =="Tabebuia cassinoides"),]
caixeta.sem.retiro

unique(semretiro$local) ##ta errado aqui tambem

##! siginifica n�o, exclama��o siginifica nao, tira o que n�o quero, n�o pega o que cumprir as condi��es abaixo


##quatro rashtagas no final da frase � um capitulo do script####
#crie os objetos abaixo, junte eles num dataframe de duas colunas chamado comNA,
#depois crie um novo objeto chamado semNA, removendo todas as linhas que
#contenham NA, usando a notação acima (dica: só se usa "" para valores do tipo
#character)
id = 1:80
a = c(121.72355, 103.79754, 130.15442, 98.29305, 103.43365, 102.44998,
      NA, 111.07215, 113.74047, 103.16081, 80.87149, 98.66692,
      65.09549, 155.74965, 88.30168, 147.43610, 114.60806, 109.87433,
      149.54772, 83.54137
)
b = c(77.91352, 78.07251, 81.95604, 75.64862, 78.45213, 79.11058,
      79.98952, 79.18127, 840.1635, 74.86860, 82.01886, 78.26936,
      77.94691, 78.75372, 77.64901, NA, 77.19803, 72.48175,
      83.45336, 78.99681
)
c = c(127.9366, 201.7158, NA, 136.5880, 131.7213, 118.1486,
      125.7534, 139.6544, 163.5890, 139.7455, NA, 141.4450, 110.7311,
      157.5921, 176.8437, 102.8659, 121.8286, 134.7097, 157.1392, 166.7133
)
d = c(191.3721, 216.1671, 165.4380, 196.2730, 172.6565, 178.2955,
      193.6687, NA, 160.2968, 208.4400, 204.0934, 208.1798,
      186.6380, 193.9446, NA, 198.6853, 213.8838, 210.1881,
      209.9109, 210.9228
)

comNA=data.frame(id,y=c(a,b,c,d))
semNA = comNA[!is.na(comNA$y),]
semNA2 =na.omit(comNA)


####Novo exercicio

machos = c(120,107,110,116,114,111,113,117,114,112)
femeas = c(110,111,107,108,110,105,107,106,111,111)
chacais=data.frame(machos,femeas)
media.m=mean(machos)
media.f=mean(femeas)
media.sp = mean(c(machos,femeas))
media.sp
machos.grandes=machos[machos>media.f]
machos.grandes2=chacais$machos[chacais$machos>media.f]
machos.grandes2
machos.grandes2=lenght(chacais$machos[chacais$machos>media.f])
machos.grandes2
