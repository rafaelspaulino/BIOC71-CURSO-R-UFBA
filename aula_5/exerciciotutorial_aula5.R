#exercicio tutorial - site ib-usp
#EXERCICIO 1 - 4. Tutoriais de An√°lise Explorat√≥ria de Dados
setwd("C:/Doutorado/disciplina_r")
aves.c <- read.table("aves_cerrado.csv", row.names=1, header=T, sep=";"
                     , dec=",", as.is=T) ## objeto criado e tabela lida
head(aves.c)
tail(aves.c)
str(aves.c)
summary(aves.c) ##verificando a estrutura dos dados da tabela


aves.c[aves.c$urubu==NA,] #toda planilha "virou" NA, √© preciso identificar o NA corretamente na planilha

is.na(aves.c) #retorna onde estao os NA da tabela
is.na(aves.c$urubu) #retorna true ou false nos locais onde aparecem os NA, comente para urubu

aves.c[is.na(aves.c$urubu),] #retorna os outros valores das colunas para a linha que tem o NA em "urubu".
aves.c[is.na(aves.c$urubu)|is.na(aves.c$carcara)|is.na(aves.c$seriema),] #retorna os valores de NA das colunas uma ˙nica vez

temp1 = aves.c[is.na(aves.c$urubu)|is.na(aves.c$carcara)|is.na(aves.c$seriema),] #guardou parte da planilha em um objeto temporario

aves.c$urubu[is.na(aves.c$urubu)] = 0
aves.c[is.na(aves.c$urubu),2] = 0
aves.c[is.na(aves.c[,2]), 2] = 0 #reconhecendo os NA como zero

aves.c$carcara[is.na(aves.c$carcara)] = 0 #mesmo processo acima para as outras especies
aves.c$seriema[is.na(aves.c$seriema)] = 0 #idem ao de cima

aves.c[aves.c$urubu==0|aves.c$carcara==0|aves.c$seriema==0,]
temp1 ##onde era na virou zero

table(aves.c$fisionomia) # tabulou dados da coluna fisionomia 

aves.c$fisionomia[aves.c$fisionomia=="ce"] <- "Ce"
table(aves.c$fisionomia) #acertando o erro de Ce e ce. ambos tornaram-se uma coisa so.

aves.c$fisionomia <- factor(aves.c$fisionomia, levels=c("CL","CC","Ce")) #converte a coluna fisionomia em um fator organizado pelos niveis CL, CC, Ce (do mais aberto para menos)
str(aves.c) #Resumo dos valores
summary(aves.c) #Resumo dos valores

####parte 2 - M√©dia, Mediana e Quantis

mean(aves.c[,2:4]) #deu erro, argumento nao numerico e nem logico

sapply(aves.c[,2:4],mean)
sapply(aves.c[,2:4],median) ##criou medias e medianas dos valores do dataframe e "uniu" todos com sapply

apply(aves.c[,2:4],2,median)#calculando a media para as especies (fatores?)

apply(aves.c[,2:4], 2, mean, trim=0.1) #calculando a media truncada para os fatores

quantile(aves.c$urubu) 
summary(aves.c$urubu) #retornou valores similares entre quantile e summary

quantile(aves.c$urubu, probs= seq(from=0,to=1,by=0.1)) #mudando para os quantis solicitados
summary(aves.c[,2:4]) ##summary de todos valores


##Explora√ß√£o de uma Variavel Categorica

caixeta <- read.csv("caixeta.csv", as.is=T) #criou objeto com os arquivos de caixeta.csv
names(caixeta) #titulo para colunas
table(caixeta$especie) #lendo e gerando tabela

sort(table(caixeta$especie), decreasing=T)#ordenando valores, do maior para o menor


barplot(sort(table(caixeta$especie), decreasing=T)) #Plotou os valores das especies do maior para o menor
barplot(table(caixeta$local)) #Plota a coluna local em um grafico de barplot (barras)

##Graficos para uma Variavel
par(mfrow=c(2,2)) #funcao para detrminar o numero de graficos (em linhas e colunas) em um mesmo dispositivo
boxplot(aves.c$urubu) #Boxplot da coluna urubu
hist(aves.c$urubu) #Histograma da coluna urubu
plot(density(aves.c$urubu)) #Plot da densidade de urubus
stripchart(aves.c$urubu, method="stack") ##4 tipos de graficos gerados
par(mfrow=c(1,1)) #selecionando apenas um grafico por dispositivo

#Variacoes do Histograma
## Histograma com os valores (funcao rug)
hist(aves.c$urubu)
rug(jitter(aves.c$urubu)) #inseri "mais" ticks, outros valores no eixo x, nao entendi ao certo, mas eles podem representar outros valores do eixo
?rug

hist(aves.c$urubu, prob=T) #histograma da coluna urubu
lines( density(aves.c$urubu),col="blue" ) #verificando distribuicao normal dos dados atraves de uma linha de densidade

hist(aves.c$urubu, prob=T)
curve(expr = dnorm(x,mean=mean(aves.c$urubu),sd=sd(aves.c$urubu)),add=T, col="red") #verificando a distribuicao dos dados e indicando uma curva para demonstrar esta ditribuicao

plot(density(aves.c$urubu),col="blue", ylim=c(0,0.08)) #plotando a curva de densidade
curve(expr = dnorm(x,mean=mean(aves.c$urubu),sd=sd(aves.c$urubu)),add=T, col="red") ##linhas sobrepondo-se dd=T, col="red". Plotou a curva normal, baseada na media e desvio padr„o 


##table e aggregate
table(caixeta$especie,caixeta$local) #gerar tabela com especies e local


caixeta.alt = aggregate(caixeta$h, by=list(local=caixeta$local,especie=caixeta$especie),FUN=mean)
#Data.frame do objeto caixeta com a altura mÈdia dos fustes de cada espÈcie de ·rvore por local

caixeta.alt #funcoes em um mesmo objeto 

#xtabs
Titanic.df <- read.csv("titanic.csv", as.is=T) #Carrega o objeto Titanic.df como arquivo Titanic.csv
Titanic.df 
xtabs(Freq~Sex+Survived, data=Titanic.df) #Cria uma tabela de contigÍncia, aqui, Freq~Sex+Survived
?xtab
prop.table(xtabs(Freq~Sex+Survived, data=Titanic.df), margin=1) #Resultado da tabela de contigÍncia em proporÁ„o
?prop.table
xtabs(Freq~Class+Survived, data=Titanic.df) #gerou uma tabela de contigÍncia
prop.table(xtabs(Freq~Class+Survived, data=Titanic.df), margin=1) #Resultado da tabela de contigÍncia em proporÁ„o

table(Titanic.df$Sex,Titanic.df$Survived)

#FÛrmula EstatÌstica em Gr·ficos
boxplot(urubu~fisionomia, data=aves.c)#boxplot de urubu em funcao da fisionomia
plot(seriema~urubu, data=aves.c, subset=fisionomia=="Ce") #plot da relacao entre urubu e seriema em Ce
plot(seriema~urubu, data=aves.c, subset=fisionomia=="CC") #plot da relacao entre urubu e seriema em CC
plot(seriema~urubu, data=aves.c, subset=fisionomia!="CL")#plot da relacao entre urubu e seriema em CL


library(lattice)
xyplot(seriema~urubu|fisionomia, data= aves.c)#um grafico diferente de todos vistos ate o momento foi gerado, relacao urubu seriema nas 3 fisionomias cl, cc, ce

##O quarteto de Anscombe
data(anscombe)#carrega para a area de trabalho
ls() #agora o objeto est√° no workspace
##objeto criado com variaveis x1 a x4 e y1 a y4

names(anscombe) #carrega para arrea de trabalho

apply(anscombe[1:4], MARGIN=2, FUN=mean)
apply(anscombe[5:8], 2, mean) #verificando diferenca entre medias

apply(anscombe[1:4], 2, var)
apply(anscombe[5:8], 2, var) ##verificando diferenca entre variacoes

with(anscombe,cor(x1,y1))
with(anscombe,cor(x2,y2))
with(anscombe,cor(x3,y3))
with(anscombe,cor(x4,y4)) #testando a relacao entre variantes

par(mfrow=c(2,2)) # 4 graficos em uma janela
plot(y1~x1, data=anscombe) #Plota Y1 em funÁ„o de X1
plot(y2~x2, data=anscombe) #Plota Y2 em funÁ„o de X2
plot(y3~x3, data=anscombe) #Plota Y3 em funÁ„o de X3
plot(y4~x4, data=anscombe) #Plota Y4 em funÁ„o de X4
par(mfrow=c(1,1)) ##gerando plots

par(mfrow=c(2,2)) # 4 graficos em uma janela
plot(y1~x1, data=anscombe,
     xlim=range(anscombe[,1:4]),ylim=range(anscombe[,5:8]))
abline(lm(y1~x1, data=anscombe))
plot(y2~x2, data=anscombe,
     xlim=range(anscombe[,1:4]),ylim=range(anscombe[,5:8]))
abline(lm(y2~x2, data=anscombe))
plot(y3~x3, data=anscombe,
     xlim=range(anscombe[,1:4]),ylim=range(anscombe[,5:8]))
abline(lm(y3~x3, data=anscombe))
plot(y4~x4, data=anscombe,
     xlim=range(anscombe[,1:4]),ylim=range(anscombe[,5:8]))
abline(lm(y4~x4, data=anscombe))
par(mfrow=c(1,1))
 #gerando 4 graficos em um mesmo dispositivo. Os graficos gerados tambem possuem linahs de tendencia geradas pelo abline

#ExercÌcios 4 - An·lises ExploratÛrias
#4.2 Cervejas

cervejas = c("chope","lata","garrafa","chope","garrafa", "garrafa","lata","lata","nenhuma","lata","garrafa","garrafa", "garrafa","lata","lata","lata","garrafa","lata","chope","nenhuma", "garrafa","garrafa","garrafa","chope","garrafa","garrafa","chope","garrafa","lata","lata")
cerveja.tab = table(cervejas)
cerveja.tab
barplot(cerveja.tab)
dotchart(as.vector(cerveja.tab), labels=names(cerveja.tab))


#4.3 Caixetais
#Neste exercÌcio, use o objeto caixeta, criado no tutorial ExploraÁ„o de uma Vari·vel CategÛrica.

caixeta <- read.csv("caixeta.csv", as.is=T)
#Construa um histograma do dap1) dos fustes dos caixetais.
caixeta
hist(caixeta$cap/2*pi) ##histograma gerado


caixeta.arv = caixeta[caixeta$fuste==1,-4]
caixeta.h.arv = aggregate(caixeta$h,
                        by=list(especie=caixeta$especie,
                                local=caixeta$local,
                                parcela=caixeta$parcela,arvore=caixeta$arvore),
                        FUN=max)
##verificando
head(caixeta.h.arv)
##Histogramas gerados
require(lattice)
hist(~x|local,data=caixeta.h.arv)
##Densidade
densityplot(~x|local,data=caixeta.h.arv)
## O mesmo com a funcao plot

plot(density(caixeta.h.arv$x[caixeta.h.arv$local=="chauas"]),
     xlim=range(caixeta.h.arv$x), main="", xlab="Altura (m)")
lines(density(caixeta.h.arv$x[caixeta.h.arv$local=="jureia"]),col="red")
lines(density(caixeta.h.arv$x[caixeta.h.arv$local=="retiro"]),col="blue")
legend("topright",c("Chauas","Jureia","Retiro"),lty=1,col=c("black","red","blue"))
## existe diferenca nas distribuicoes de alturas




#4.4 Eucaliptos
#Neste exercÌcio, use o conjunto de dados Invent·rio em Florestas Plantadas de Eucalyptus grandis.
#Utilize o gr·fico boxplot para analisar o DAP de ·rvores de E. grandis em funÁ„o das vari·veis regi„o (regiao) e rotaÁ„o (rotacao).
#Avalie a normalidade da altura do conjunto total de ·rvores com um gr·fico quantil-quantil contra a distribuiÁ„o normal.
grandis <- read.table("egrandis.csv",sep=";",dec=".", header=T)
str(grandis)

## Dap x regiao
boxplot(dap~regiao,data=grandis)
boxplot(dap~rotacao,data=grandis)

## Quantil-quantil normal
qqnorm(grandis$ht)
qqline(grandis$ht)
hist(grandis$ht, prob=T)


#4.5 Mais Caixetais
#Aqui usaremos novamente o objeto caixeta, criado no tutorial ExploraÁ„o de uma Vari·vel CategÛrica.
#Analise a relaÁ„o dap-altura ('dap' e 'h') em funÁ„o do caixetal (local) com a funÁ„o plot, mas somente para as ·rvores 2) de caixeta (Tabebuia cassinoides).
#Para a mesma relaÁ„o do item anterior, verifique linearidade com a funÁ„o scatter.smooth
#Utilizando o pacote lattice, analise a relaÁ„o dap-altura ('dap' e 'h') em funÁ„o do caixetal (local), mas somente para as ·rvores 3) de caixeta (Tabebuia cassinoides).

##calculo do dap total das arvores
## Area do fuste
caixeta$ab = caixeta$cap^2/(4*pi)

caixeta.arv = aggregate(caixeta$ab,
                      by=list(arvore=caixeta$arvore,parcela=caixeta$parcela,
                              local=caixeta$local),
                      sum)


## agregando a coluna de altura ao objeto 
caixeta.arv$h = temp$x
##a variavel dap ganhou o nome de "x":
names(caixeta.arv)
##mudando
names(caixeta.arv)[4] <- "dap"
par(mfrow=c(2,2))
plot(h~dap, data=caixeta.arv, type="n", main="Chauas") ## criando grafico
points(h~dap, data=caixeta.arv, subset=local=="chauas")
plot(h~dap, data=caixeta.arv, type="n", main="jureia") ## criando grafico
points(h~dap, data=caixeta.arv, subset=local=="jureia")
plot(h~dap, data=caixeta.arv, type="n", main="retiro") ## criando grafico 
points(h~dap, data=caixeta.arv, subset=local=="retiro")
par(mfrow=c(1,1))

par(mfrow=c(2,2))
with(caixeta.arv[caixeta.arv$local=="chauas",],scatter.smooth(dap,h,main="Chauas"))
with(caixeta.arv[caixeta.arv$local=="jureia",],scatter.smooth(dap,h,main="Jureia"))
with(caixeta.arv[caixeta.arv$local=="retiro",],scatter.smooth(dap,h,main="Retiro"))
par(mfrow=c(1,1))

#pacote lattice
xyplot(h~dap|local, data=caixeta.arv)




