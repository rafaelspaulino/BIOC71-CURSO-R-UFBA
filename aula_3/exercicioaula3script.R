######################################################
# Introdução Linguagem R                          ####
# Vitor Passos Rios                               ####
# Universidade Federal da Bahia                   ####
# https://github.com/vrios/Intro-Linguagem-R/wiki#####
######################################################

#diferencie a função source da função load()
## source lê e executa todas funções do script. 
#load() carrega arquivos .Rdata criados no diretório (workspace).

#baixe para seu diretório de trabalho o arquivo toroidal.distance.R, disponível
#em https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/toroidal.distance.R, e o arquivo distancias.csv, disponivel em https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/distancias.csv

download.file("https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/toroidal.distance.R", destfile = "toroidal.distance.R")

source ("https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/toroidal.distance.R") 
        
download.file ("https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/distancias.csv", destfile = "distancias.csv" )


#Abra toroidal.distances.R no R
list.files()
ls()
##abri em outro script

# O que você precisa fazer para que as funções contidas nesse arquivo estejam disponíveis para uso no R?
#executar com source()

# Faça o procedimento que você descreveu acima
source ("toroidal.distance.R")

# Dentro do script toroidal.distance.R, altere o nome da função toroidal.distances para distance.matrix (substitua o nome dentro do arquivo) e salve o arquivo

# Carregue o arquivo distancias.csv para dentro do objeto distancias
#chame a função distance.matrix() com o objeto distancias, e o argumento tam = 100

distancias = distancias.csv
distancias = read.csv("distancias.csv", 
                      header = TRUE, #interpreta a primeira linha como sendo o nome das colunas
                      as.is = TRUE , # não altera interpreta o tipo de dado em cada coluna, não altera seus dados. Se for FALSE, texto é interpretado como factor
                      sep = ",", # define o caractere que deve ser o separador de colunas
                      dec = ".") #define o caractere que deve ser o spearador de decimal

distancias

distance.matrix(distancias, tam = 100)

# O que aconteceu?
##Foi criado um objeto de matriz de distâncias, com os dados da planilha distancias.csv

# O que você precisa fazer para que você possa usar a função distance.matrix?
##usar a função source para reconhecimento da nova função (distance.matrix),source habilita a função

# Salve o resultado do comando acima com o nome de matriz.distancias.csv
matriz.distancias = distance.matrix(distancias, tam = 100)
matriz.distancias

write.table (x = matriz.distancias , 
      file = "matriz.distancias.csv",
      sep = "," ,
      dec = ".",
      row.names = F
) 

  
# Usando a linha de comando, importe o arquivo dragoes.xsls para o objeto DnD
#https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/dragoes.xlsx (não abra o excel nem salve em .csv)

library(readxl)
getwd()
DnD = read_xlsx("dragoes.xlsx")


# Confira a estrutura do arquivo ##conferido, OK
summary (DnD)

# Há algum NA? Muitos.. houve algum problema com o cabeçalho?##sim, há duas linhas do cabeçalho

# Refaça o script da aula 2, salvando o objeto caixeta, adicionando a coluna coletor e desvio, em um arquivo chamado caixeta_com_desvio.csv

write.csv (x = caixeta,
           file = "caixeta_com_desvio.csv",
           row.names = F
           )
head(caixeta)

