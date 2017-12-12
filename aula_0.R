letters()   
  library(cars)   
  plot(cars)   
  rep("Oi", 10)  
  seq(from = 100, to = 1000, by = 50)  
  help(seq)  
  ??NA  
  a = sqrt(2)  
  iris  
  summary(iris)  
  x = c(1:70)  
  plot(x)  
  mean(x)  
  mean(x^2)  
  mean(x)^2
  plot(x = Idade, y = TamanhoDaAsa)  
  modelo = lm(TamanhoDaAsa~Idade)  
  summary(modelo)
  media.Idade = mean(Idade)  
  media.TamanhoDaAsa = mean(TamanhoDaAsa)  
  desvio.quadrado.Idade = (Idade - media.Idade)^2  
  desvio.quadrado.TamanhoDaAsa = (TamanhoDaAsa - media.TamanhoDaAsa)^2  
  ss.Idade = sum(desvio.quadrado.Idade)  
  produto.cruzado = (Idade - media.Idade) * (TamanhoDaAsa - media.TamanhoDaAsa)  
  ss.prod.cruz = sum(produto.cruzado)  
  b = ss.prod.cruz/ss.Idade  
  a = media.TamanhoDaAsa- b * media.Idade  
  TamanhoDaAsa.previsto = a + b * Idade  
  ss.t = sum(desvio.quadrado.TamanhoDaAsa)  
  desvio.quadrado.previsto = (TamanhoDaAsa.previsto - media.TamanhoDaAsa)^2  
  ss.regressao = sum(desvio.quadrado.previsto)  
  desvio.quadrado.residuo = (TamanhoDaAsa.previsto - TamanhoDaAsa)^2  
  ss.residuo = sum(desvio.quadrado.residuo)  
  df.regressao = 1  
  df.residuo = length(Idade) - 2  
  ms.regressao = ss.regressao / df.regressao  
  ms.residuo = ss.residuo / df.residuo  
  f = ms.regressao/ms.residuo  
  r.quad = ss.regressao/ss.residuo
  plot(TamanhoDaAsa ~ Idade, xlab = "Idade (décadas)",  
     ylab = "Comprimento (metros)",  
     main = "Tamanho da asa"  
     , bty = "n"  
     , xlim = c(0, 23)  
     , ylim = c(0, max(TamanhoDaAsa))  
     , lwd = 2  
     , yaxt = "n"  
     , xaxt = "n"  
     )  
  axis(1, pos = 0)  
  axis(2, pos = 0)  
  abline(a = a, b = b, col = "red", lwd = 2)  
  anova(modelo)  
  coefficients(modelo)  
  plot(modelo)  
  summary(modelo)  
  plot(Idade, modelo$residuals)  
  abline(h = 0)
