##Rafael Paulino - exercicio gr√°ficos
getwd()
setwd ("C:/Doutorado/disciplina_r")

####EXERCICIO 1
esaligna = read.table("esaligna.csv", header = T, sep = ",")
esaligna
#Construa ‚Äúplot‚Äù, boxplot e barplot
#dap e ht  
#ht e tronco
#dap e classe
#dap e talhao
#dap
#ht

#plots
plot(x=esaligna$dap, y=esaligna$ht) #dap em funcao de ht
plot(x=esaligna$ht, y=esaligna$tronco) #ht em funcao de tronco
plot(x=esaligna$dap, y=esaligna$classe) #dap em funcao de classe
plot(x=esaligna$dap, y=esaligna$talhao) #dap em funcao do talhao
plot(x=esaligna$dap) #somente o dap, sem relacao com outra variavel
plot(x=esaligna$ht) #somente ht, sem rela√ß√µa com outra variavel

#boxplots
boxplot(esaligna$dap~esaligna$ht) #"erro" devido as v√°riaveis serem num√©ricas - gera um boxplot muito estranho
boxplot(esaligna$ht~esaligna$tronco)#"erro" devido as v√°riaveis serem num√©ricas - gera um boxplot muito estranho
boxplot(x=esaligna$dap~y=esaligna$classe)#"erro" devido as v√°riaveis serem num√©ricas - gera um boxplot muito estranho
boxplot(esaligna$dap~esaligna$talhao) #este deu certo pois uma das variaveis √© categoriga e n√£o num√©rica
boxplot(x=esaligna$dap) #apesar de ter dado "certo",vari√°veis categorigas solit√°rias, n√£o se faz boxplot
boxplot(x=esaligna$ht)#apesar de ter dado "certo",variaveis categorigas solit√°rias, n√£o se faz boxplot

#barplot
barplot(x=esaligna$dap~y=esaligna$ht)
barplot(x=esaligna$ht~y=esaligna$tronco)
barplot(x=esaligna$dap~y=esaligna$classe)
barplot(x=esaligna$dap~y=esaligna$talhao)
#todas 4 "funcoess acima apresentaram erros por nao serem variaveis unicas
barplot(esaligna$dap) #variavel unica = possibilidade de gerar barplot
barplot(esaligna$ht) #variavel unica = possibilidade de gerar barplot

par(las=1) #muda a legenda para ficar na horizontal
plot(riqueza~area, las=3) #mudou a direcao da legenda
par(cex=2) #modifica o tamanho dos pontos do grafico
plot(riqueza~area, cex=2) #deu erro, pois as margens n√£o suportam o "novo" tamanho dos pontos

####EXERCICIO 2
?plot
riqueza <- c(15,18,22,24,25,30,31,34,37,39,41,45)
area <- c(2,4.5,6,10,30,34,50,56,60,77.5,80,85)

#Mude
#O nome do eixo x para ‚ÄúTamanho da Ilha (ha)‚Äù
#O nome do eixo y para ‚ÄúRiqueza de Esp√©cies‚Äù
#O t√≠tulo do gr√°fico para ‚ÄúAves das Ilhas Samoa‚Äù

riqueza #v√°riaveis
area #v√°riaveis
plot(riqueza,area  
     , xlab = "Tamanho da Ilha"
     , ylab = "Riqueza de Esp√©cies"
     ,main = "Aves das Ilhas Samoa") #gr√°fico gerado com as mudan√ßas solicitadas.

##Coisas para comentar da pagina
par(mfrow=c(2,1))
plot(riqueza~area)
boxplot(riqueza~area.cate) ##alterou a quantidade de graficos em "uma pagina" de visualiza√ß√£o, mfrow (neste caso) inseri dois gr√°ficos em uma linha

par(mfrow=c(1,2))
plot(riqueza~area)
boxplot(riqueza~area.cate)  ##alterou a quantidade de graficos em "uma p√°gina" de visualizaco, mfrow (neste caso) inseri dois gr√°fico em duas colunas, boxplot n√£o foi gerado pois a vari√°vel √© num√©ricoa e n√£o categoriga.

par(mfrow=c(2,1))
par(mar=c(4,14,2,6))
plot(riqueza~area)
boxplot(riqueza~area.cate) ## mar controla o tamanho das margens dos gr√°ficos, boxplot n√£o foi gerado pois a vari√°vel √© num√©ricoa e n√£o categoriga.

par(mfrow=c(1,2))
par(mar=c(14,4,8,2))
plot(riqueza~area)##erro, n√£o plotou o gr√°fico, devido ao tamanho da margem solicitada.N√£o consegue plotar com as margens definidas
boxplot(riqueza~area.cate) ## objeto area.cate n√£o encontrado, talvez por ser uma vari√°vel num√©rica


par(mfrow=c(1,2))
par(mar=c(8,4,8,1))
plot(riqueza~area) ##plot gerado, as novas margens suportam este gr√°fico
par(mar=c(14,2,4,0.5))
boxplot(riqueza~area.cate) ##boxplot nao gerado,devido a v√°riavel ser numerica


#Agora entre no:
?par
#Usando o mesmo gr√°fico anterior, mude: 
#O tipo de ponto (numero de 0 a 25)
#O tamanho dos pontos e legendas
#A dire√ß√£o da escala do gr√°fico (para ficar tudo na horizontal)
#O tipo de fonte das legendas (para ficar tudo como em Times New Roman ‚Äì dica= ‚Äúserif‚Äù)

x11()
par(pch =16
    ,cex = 2
    ,cex.axis = 2
    ,las = 1
    ,family = "serif") ##funcao par para alterar os graficos que se seguem

plot(riqueza,area  
     , xlab = "Tamanho da Ilha"
     , ylab = "Riqueza de Esp√©cies"
     ,main = "Aves das Ilhas Samoa")

dev.off()



####EXERCICIO 3
riqueza = c(15,18,22,24,25,30,31,34,37,39,41,45)
area = c(2,4.5,6,10,30,34,50,56,60,77.5,80,85)
area.cate = rep(c("pequeno","grande"), each=6)

#Crie
plot(riqueza~area)
#E agora
plot(riqueza~area, bty="l", tcl=0.3) #perdeu as linhas externas (superior e da direita) e os tracos (ticks) que demarcam o eixo x foram para parte interna do grafico

#Perecebeu o que mudou?
#Agora tente
boxplot(riqueza~area.cate, bty="l", tcl=0.3) ##foi criado um boxplot, porem as margens nao foram "retiradas" e nem os traÁos (ticks) que demarcam o eixo x

#O que aconteceu?
#E agora?
par(bty="l")
par(tcl=0.3)
boxplot(riqueza~area.cate)
##agora o boxplot foi modificado, perdendo as linhas externas (superior e direita) e os traÁos que demarcam o eixo x foram pra parte interna

##EXERCICIO 4 - come√ßar a fazer
riqueza = c(15,18,22,24,25,30,31,34,37,39,41,45)
area = c(2,4.5,6,10,30,34,50,56,60,77.5,80,85)
abundancia = rev(riqueza)

#seguindo o ordenado - criando linhas, eixos e outros elementos
plot(riqueza~area) #plot gerado
lines(lowess(area, riqueza)) #uma linha foi criado sobre a distribuicao dos pontos, lowess È um ajuste polinomial linear

model =  lm(riqueza~area) #criado um modelo de regress„o simples (lm)
plot(riqueza~area) #plot gerado 
abline(model) #linha de tendencia criada a partir do modelo linear acima

plot(riqueza~area)
abline(15,0.4) ##linha reta com intercepto e inclinaÁ„o definido por "mim".
#poderia ser
abline(14, 0.3) #somente um exemplo de outra definiÁ„o do intercepto

plot(riqueza~area) #plot gerado
abline(v=mean(area)) #linha vertical gerada (mÈdia da area)
abline(h=mean(riqueza)) #linha horizontal gerada (media de riqueza)

plot(riqueza~area)
text(20,40,"texto") #inserÁ„o de um elemento textual no gr·fico; os numeros 20, 40 indicam onde o texto aparece dentro do gr·fico

plot(riqueza~area)
mtext("legenda errada 2", side=4, line=0.9, at=20,cex=2, family="serif") ##mtext ajuda a criar uma legenda e comando mais "refinados"

plot(riqueza~area)
par(new=TRUE)
plot(abundancia~area) ##sobreposicao de gr·ficos diferentes

plot(riqueza~area)
par(new=TRUE)
plot(abundancia~area, axes=FALSE, ann=F, pch=16)
axis(4)
##foi plotado os dados de dois grafico em apenas um (uma imagem), e foi criado um outro eixo para representar o segundo grafico inserido, porem este novo eixo esta sem legenda.... eu usei mtext(abundancia) para criar esta legenda, mas ela ficou na parte superior do grafico e n„o a lateral esquerda. Ent„o retirei o comando



plot(riqueza~area)
rect(20,20,40,40) #criou uma ·rea (retangular) que destacou alguns pontos do grafico

plot (riqueza~area)
jpeg(filename = "NomeNovo.jpg") ##salvando o grafico no formato desejado
plot (riqueza~area) #gerandodispositivo salvo como NomeNovo.jpg
dev.off() # encerramento do dispositvo aberto acima e criado com sucesso

setwd("C:/Doutorado/disciplina_r")
jpeg(filename = "Rplotaula.jpg", width = 480, height = 480, 
     units = "px", pointsize = 12, quality = 100,
     bg = "white",  res = NA, restoreConsole = TRUE) #imagem Rplotaula gerada perfeitamente

par(mfrow=c(1,2))
par(mar=c(14,4,8,2))
plot(riqueza~area)
boxplot(riqueza~area.cate)

dev.off()
#salvo no diretorio

png("meugrafico%02d.png")

bmp(filename = "Rplot%03d.bmp")
jpeg(filename = "Rplot%03d.jpg")
png(filename = "Rplot%03d.png")
tiff(filename = "Rplot%03d.bmp") ##nao entendi

x11() #abre uma janela exclusiva e maior para plotar o grafico
plot(riqueza~area)

dev.set(which=2) #troca o dispositivo ativo (nao entendi)

png("figura%02d.png") #numera automaticamente os dispositivos criados
pdf("figura%02d.pdf")

dev.list()
dev.cur()
dev.set(3)
dev.cur()
#lista de dispositivos abertos


dev.off() #fechar o dispositivo em aberto

setwd("C:/Doutorado/disciplina_r")
##EXERCICIO 5
#Crie diferentes gr·ficos em diferentes dispositivos. Por fim salve-os em jpeg.

?jpeg
#dispositivo 1 - grafico Riq_area - plot
plot(riqueza~area)
jpeg(filename = "Riq_area.jpg", width = 480, height = 480, 
    units = "px", pointsize = 12, quality = 100,
    bg = "white",  res = NA, restoreConsole = TRUE,
    type = c("windows", "cairo")) ##coloquei esta ultima linha seguindo o help, mas ao tirar esta funcao nao notei nenhuma mudanca no grafico
par(mfrow=c(1,1))
plot(riqueza~area)
dev.off()   ##grafico gerado

##dispositivo 2 - grafico Riq_area_cate - boxplot
boxplot(riqueza~area.cate)
jpeg(filename = "Riq_area_cate.jpg", width = 480, height = 480, 
     units = "px", pointsize = 12, quality = 100,
     bg = "white",  res = NA, restoreConsole = TRUE)
boxplot(riqueza~area.cate)
##par(mfrow=c(1,1)) retirei esse comando e o grafico continuou da mesma forma
dev.off() ##grafico gerado, "brinquei" com alguns comandos para entender para que servia cada um.

dev.list()

##dispositivo 3 - barplot "r_Area.jpg" - barplot
barplot(area)
jpeg(filename = "r_Area.jpg", width = 480, height = 480, 
     units = "px", quality = 100,
     bg = "white",  res = NA, restoreConsole = TRUE)
barplot(area)
dev.off()

##dispositivo 4 - barplot "Riqueza_bar.jpg" - barplot - mudei os parametros do grafico, como tamanho e cor
barplot(area)
jpeg(filename = "Riqueza_bar.jpg", width = 400, height = 500, 
     units = "px", quality = 200,
     bg = "blue",  res = NA, restoreConsole = TRUE)
barplot(area)
dev.off() ##grafico similar ao de cima (dipositivo 3), porÈm com parametros diferentes.

dev.list()
dev.off()

#PRIMEIRO EXERCICIO FINALIZADO.

####SEGUNDO EXERCICIO DA AULA 4
#5.1 - Crie um gr·fico de dispers„o entre "dap"1) e "ht"2) com:
 
#Legendas dos eixos com nomes das vari·veis e suas unidades
#MarcaÁıes do eixos (ticks) para dentro da ·rea do gr·fico
#Apenas dois eixos (formato "L")
#TÌtulo informativo
#Tamanho das fontes maiores que o padr„o
esaligna = read.table("esaligna.csv", header = T, sep = ",")
esaligna
summary(esaligna)
head(esaligna)

#criando grafico de dispersao entre dap e ht
plot(esaligna$dap, esaligna$ht
     ,xlab = "DAP (cm)"
     ,ylab = "HT (m)"
     ,main = "RelaÁ„o DAP e HT"
     ,bty="l"
     ,tcl=0.3
     ,cex.main = 2
     ,cex.lab = 1.7)

#5.2 - Dois gr·ficos juntos
#Use as vari·veis "dap" e "talhao" para construir dois gr·ficos, colocando-os lado a lado. O primeiro deve ser um gr·fico de desenho de caixa (boxplot) da vari·vel "dap" em funÁ„o do fator "talh„o". O segundo deve ter apenas a mÈdia e uma barra de desvio-padr„o do dap, para cada talh„o.
#Insira tambÈm uma letra para dizer qual È o gr·fico "a" e qual È o "b" (tanto faz, quem È um e quem È outro).
#Dica: vocÍs ter„o que calcular a mÈdia e os desvios-padr„o do dap das ·rvores em cada talh„o. Depois crie uma matriz com estes valores e crie o plot destes valores.

##seguindo a dica de criar matriz
esaligna$talhao = as.factor(esaligna$talhao)
media.dap = aggregate(x=esaligna$dap, by = list(esaligna$talhao), FUN = mean,na.rm = T)
desvio.dap = aggregate(x=esaligna$dap, by = list(esaligna$talhao), FUN = sd,na.rm = T)
(matriz.dap = matrix (c(media.dap$x, desvio.dap$x), ncol = 2))

#Criar os graficos
par(mfrow=c(1,2))
boxplot(esaligna$dap~esaligna$talhao, ylab = "dap", xlab = "talhao") ##gerar o boxplot
mtext ("a")

#segundo grafico
(y0 = media.dap$x - desvio.dap$x)
(y1 = media.dap$x + desvio.dap$x)
(limite = range(max (y1),min(y0)))

plot(media.dap$x, ylab="dap(media)", xlab = "talhao", ylim = limite)
arrows(x0=1:6, y0=media.dap$x - desvio.dap$x, x1=1:6, y1=media.dap$x + desvio.dap$x, length = 0.05, angle=90, code=3)
mtext ("b")



#EXERCICIO 5.3 - NAO DEU TEMPO DE FAZER KKKK, DESCULPE PROFESSOR
novo=read.table("fetch.txt", header = T)
novo
     
     