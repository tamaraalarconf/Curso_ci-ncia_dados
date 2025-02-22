setwd("D://Users//tamar//Documents//R//Luis Otavio")
getwd()

#Objetos
#1 - Crie 3 objetos de forma que cada um deles perten�a a uma das classes: numeric, logical e character.
a <- seq(from=1, to=100, by=5)

b <-a %% 2 ==0

c <- c("casa", "cachorro", "arvore")

#2 - Verifique a classe de cada um dos objetos criados.
class(a)
class(b)
class(c)

#Vetores
#1 - Crie um vetor de texto character com os valores: "texto1", "palavra" e "isso � uma frase" e atribua para o objeto texto.
texto <- c("texto1", "palavra" , "isso � uma frase")

#2 - Crie um vetor com a sequ�ncia de n�meros de 1 a 10 sem escrever explicitamente todos os n�meros e atribua para o objeto sequencia.
vetor <- seq(1:10)

#Matrizes
#1 - Crie 2 vetores num�ricos com 5 elementos cada
#e, posteriormente, crie uma matriz juntando os 2 vetores criados e formando uma matriz com 2 colunas e 5 linhas.

aa <- seq(from=20, to=100, by = 20)
bb <- c(5,6,7,8,9)
cc <- matrix(cbind(aa,bb), nrow = 5, ncol = 2)

#Listas
#1 - Crie uma lista contendo uma matriz com pelo menos 2 vetores.
#Adicione no segundo elemento da sua lista um vetor de texto, com quantos elementos voc� quiser.
list(cc, texto)

#Coer��o de Classes
#1 - Execute o seguinte c�digo no seu console:
#Verifique qual a classe do objeto profissao.
#Transforme o objeto profissao para fator.

profissao <- c("cientista","analista","jogador")
class(profissao) #character
profissao <- factor(profissao)
class(profissao) #factor

#Data Frames
#1 - Crie um Data Frame com uma coluna da classe numeric, uma coluna da classe logical e outra coluna da classe character.

#2 - Altere apenas o nome da 2� coluna do seu data frame.
data1 <- seq(1:10)
data2 <- data1 %% 2==0
data3 <- ifelse (data1>=5, "maior", "menor")
data <- data.frame(data1,data2,data3)    
names(data)[2] <- "Par"
names(data)


#Bibliotecas
#1 - Instale a biblioteca devtools.
#2 - Carregue a biblioteca devtools.
if(require(devtools)) install.packages("devtools")
library(devtools)

#3 - Instale a biblioteca rCharts usando a fun��o "install_github".
#Dica para a instala��o: Consulte o reposit�rio https://github.com/ramnathv/rCharts#installation
install_github("ramnathv/rCharts")
library(rCharts)

#Importa��o de Dados
#1 Importe o conjunto de dados:
#Quando voc� acessar o link abaixo, ele ir� fazer o download de uma tabela no formato csv.
#https://people.sc.fsu.edu/~jburkardt/data/csv/addresses.csv
#Fa�a a leitura do arquivo csv baixado no item "a" usando o bot�o "import dataset".
#obs.: se atente para qual pasta o arquivo foi baixado e qual a pasta est� o seu projeto.


###########################################################################################
##########################################################################################
##############################################################

#Manipula��o de Vetores
#1 - Execute o seguinte c�digo:
#Extraia o elemento 10 de seu vetor.
vetor<-21:30
vetor[10]

#Extraia os elementos 2 e 5 (em um s� comando) de seu vetor.
vetor[c(2,5)]

#Manipula��o de Matrizes
#1 - Execute o seguinte c�digo:
#Extraia o segundo elemento da terceira coluna
    
matriz<- matrix(201:212,nrow=3,ncol=4)
matriz[2,3]

#Extraia a terceira coluna de sua matriz.
matriz[,3]

#Atribua o valor 500 para o �ltimo elemento da primeira coluna.
matriz[3,1] <- 500

#Manipula��o de listas
#1 Manipule uma lista:
#Crie uma lista com 3 elementos (um vetor num�rico, um vetor de texto e uma matriz com 3 linhas e 4 colunas).
vn <- seq(from=0, to=30, by= 5)
vt <- c("a", "b", "c", "d")
vm <- matrix(201:212,nrow=3,ncol=4)
lista <- list(vn, vt, vm)

#Fa�a a extra��o do valor correspondente a segunda linha e terceira coluna de sua matriz contida na lista.
lista[[3]][2,3]


#Manipula��o de Data Frames com a biblioteca Dplyr
#1 - Desenvolva os itens a seguir:
    
#Carregue a biblioteca dplyr
library(dplyr)

#Selecione as colunas "Day" e "Ozone" do conjunto de dados airquality usando a fun��o select.
air <- airquality
names(air)
select(air, Day, Ozone)

#Filtre as observa��es da segunda quinzena de cada m�s usando a fun��o filter (para o mesmo conjunto de dados airquality).
filter(air, Day>15)

#Repita os dois itens acima, por�m agora usando o operador %>% (pipe).
names(air)
air %>% select(Day, Ozone)
air %>% filter(Day>15)

#Para o conjunto de dados airquality completo, calcule a m�dia da vari�vel "Wind" para cada m�s. Use as fun��es group_by e summarise.
air %>% group_by(Month) %>% summarise(media= mean(Wind))

#Para o conjunto de dados airquality completo, calcule a m�dia da vari�vel "Solar.R" para cada m�s. Use as fun��es group_by e summarise.
#Dica: Nesse caso voc� precisar� definir na fun��o mean que deseja ignorar valores faltantes da vari�vel "Solar.R".
air <- na.omit(airquality)
air %>% group_by(Month) %>% summarise(media=mean(Solar.R)) 

#Crie uma nova coluna usando a fun��o mutate com o valor da vari�vel "Wind" dividida pela vari�vel "Temp".
air %>% mutate(nova_coluna=Wind/Temp)

#Ordene o conjunto de dados airquality come�ando pelas maiores temperaturas (vari�vel "Temp") e, caso haja empate entre as temperaturas, ordene em ordem crescente pela vari�vel "Solar.R". Para isso, use a fun��o arrange.
air %>% arrange(-Temp,Solar.R)

#Renomeie a vari�vel "Temp" (usando a fun��o rename) para "temperatura" no conjunto de dados airqulity.
air %>% rename(temperatura=Temp)

#2 - Execute o seguinte c�digo:
    
preco_iris<- data.frame(Species=c("setosa","virginica","versicolor"),preco=c(5,10,15))
#Junte a tabela preco_iris com a tabela nativa do R iris usando a vari�vel "Species" como chave.
library(plyr)
junta <- join(iris, preco_iris, by= "Species")
junta

#Manipula��o de Data e Hora
#1 - Execute o c�digo:
    
    Data1<-"05-03-2021 14:43:12"

Data2<-"10 Janeiro 2021"

#Verifique a classe dos objetos Data1 e Data2
class(Data1) #character
class(Data2) #character

#Transforme os objetos Data1 e Data2 para o formato de data padr�o do R usando a fun��o strptime. Atribua os resultados para os objetos Data1t e Data2t.
Data1
Data1t <- strptime(Data1, format = "%d-%m-%Y %H:%M:%S")
Data2t <- strptime(Data2, format = "%d %B %Y") #m�s extenso %B
class(Data1t)
class(Data2t)

#Extraia apenas a data do objeto Data1t (sem as horas).
format(Data1t, "%d-%m-%Y")

#Extraia apenas o ano do objeto Data2t.
format(Data2t, "%Y")

#Estruturas de Controle
#1 - Execute o seguinte c�digo:
    
Vetor1<-1:50
Vetor2<-c()

#Usando a fun��o for, atribua para cada elemento "n" do vetor2 a soma acumulada no Vetor1 de primeiro elemento at� o seu elemento n.
#vetor so um []; lista dois [[]]

for(i in 1:50){ Vetor2 <- cumsum(Vetor1)
}
Vetor2
#2 - Fa�a um looping usando a fun��o while que gere um valor aleat�rio seguindo a distribui��o uniforme
#com limites 0 e 1 e imprima o valor gerado no console.
#O looping deve ser executado at� um valor maior que 0.95 ser gerado.

##################################################################################################
##################################################################################################
i <-list()
while(i <=0.95) { i=rnorm(runif(1,min=0, max=10))
     print(i)}

#3 - Crie um looping usando a fun��o for e 10 ciclos. #Ex: for( i in 1:10). 
#Dentro desse looping, gere um valor aleat�rio seguindo uma distribui��o normal padr�o 
#(m�dia 0 e desvio padr�o 1). Se o valor for maior que 0, imprima o texto "positivo". 
#Caso contr�rio, imprima "negativo".

lista2 <- list()
for(i in 1:10) {lista2 [[i]] <- rnorm(10,mean = 0, sd = 1) 
    lista2[[i]] <- ifelse (lista2[[i]]>0, "positivo", "negativo")}
    
#4 - Usando o conjunto de dados "airquality" e a fun��o "ifelse", 
#crie uma nova coluna no conjunto de dados com os valores "ventao",
#caso o valor de "Wind" seja maior (>) que 10 ou "ventinho", 
#caso o valor de "Wind" seja menor ou igual (<=) a 10.

air <- airquality
air %>% mutate(vento= ifelse (Wind > 10, "ventao", "ventinho"))

#An�lise Explorat�ria
#1 - Fa�a uma an�lise explorat�ria com o conjunto de dados iris:
    
#Imprima o cabe�alho e o rodap� do conjunto de dados.
head(iris)
tail(iris)

#Verifique a estrutura dos seus dados. Descubra quais as classes de cada vari�vel e as dimens�es de seu conjunto de dados.
#Dica: fa�a isso usando apenas uma fun��o.
str(iris)

#Usando apenas uma fun��o, calcule estat�sticas descritivas (m�dia, mediana e quartis) das vari�veis num�ricas e a frequ�ncia das observa��es para a vari�vel categ�rica.
summary(iris)

#Calcule a frequ�ncia da vari�vel "Species" usando a fun��o table e usando a fun��o count da biblioteca dplyr
table(iris$Species)
count(iris$Species)

#Fa�a um boxplot da vari�vel "Petal.Length" e interprete o seu boxplot. Onde h� concentra��o de dados?
library(ggplot2)
names(iris)

ggplot(iris, aes(x=factor(Species), y=`Petal.Length`)) +
    geom_boxplot()
#menor petal length

#For vs lapply
#1 - Execute o c�digo abaixo:
    
#lista_exercicio<-list() # Cria uma lista vazia e atribui para o objeto lista_exercicio
#for(elemento in 1:10){ #looping com 1 milh�o de repeti��es
#    lista_exercicio[[elemento]]<-rnorm(runif(1,min = 1,max=20))
    #para cada elemento da lista � gerado um vetor com distribui��o normal (rnorm) e comprimento variando entre 1 e 20, definido pela distribui��o uniforme (runif).
#}
#head(lista_exercicio)
#Usando a fun��o for, 
#calcule o comprimento de cada elemento da lista lista_exercicio e 
#atribua o resultado para o objeto lista_comprimento_for.

lista_comprimento_for <- list()
lista_exercicio<-list() # Cria uma lista vazia e atribui para o objeto lista_exercicio
for(elemento in 1:10){
    lista_exercicio[[elemento]]<-rnorm(runif(1,min = 1,max=20))
    lista_comprimento_for [[elemento]] <- length(lista_exercicio[[elemento]])
}
head(lista_comprimento_for)
head(lista_exercicio)

#Usando a fun��o lapply, calcule o comprimento de cada elemento da lista lista_exercicio e 
#atribua o resultado para o objeto lista_comprimento_lapply.
lista_exercicio<-list()
lista_comprimento_lapply <- list()
for(elemento in 1:10){
    lista_exercicio[[elemento]]<-rnorm(runif(1,min = 1,max=20))}

lista_comprimento_lapply <- lapply(lista_exercicio, length)    
head(lista_comprimento_lapply)
head(lista_exercicio)

 


#Para calcular o tempo que cada script demorou para ser executado, use a fun��o Sys.time().

inicio <- Sys.time()
lista_comprimento_for <- list()
lista_exercicio<-list() # Cria uma lista vazia e atribui para o objeto lista_exercicio
for(elemento in 1:10000000){
    lista_exercicio[[elemento]]<-rnorm(runif(1,min = 1,max=20))
    lista_comprimento_for [[elemento]] <- length(lista_exercicio[[elemento]])
}
Sys.time()-inicio

inicio <- Sys.time()
lista_exercicio<-list()
lista_comprimento_lapply <- list()
for(elemento in 1:100000000){
    lista_exercicio[[elemento]]<-rnorm(runif(1,min = 1,max=20))}

lista_comprimento_lapply <- lapply(lista_exercicio, length)    
Sys.time()-inicio

#Criando uma fun��o na linguagem R
# - Crie uma fun��o chamada media_coluna. A fun��o dever� receber um data.frame 
#com colunas num�ricas e calcular as m�dias para cada coluna. 
#O resultado da fun��o deve ser um vetor com comprimento igual ao n�mero de colunas do data frame.

#Obs: � poss�vel usar a fun��o for ou apply para resolver o exerc�cio.

#Desafio: Adicione na fun��o acima os itens abaixo:
    
#    uma mensagem caso o input (argumento de entrada) da fun��o n�o seja um data frame.

#Caso o data frame tenha uma vari�vel que n�o � num�rica, coloque o valor NA como resultado da m�dia 
#para a coluna.

iris
str(iris)
dados <- data.frame()
media_coluna <- function (dados) {apply(dados,2, mean)} 

media_coluna(iris)
