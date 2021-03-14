setwd("D://Users//tamar//Documents//R//Luis Otavio")
getwd()

#Objetos
#1 - Crie 3 objetos de forma que cada um deles pertença a uma das classes: numeric, logical e character.
a <- seq(from=1, to=100, by=5)

b <-a %% 2 ==0

c <- c("casa", "cachorro", "arvore")

#2 - Verifique a classe de cada um dos objetos criados.
class(a)
class(b)
class(c)

#Vetores
#1 - Crie um vetor de texto character com os valores: "texto1", "palavra" e "isso é uma frase" e atribua para o objeto texto.
texto <- c("texto1", "palavra" , "isso é uma frase")

#2 - Crie um vetor com a sequência de números de 1 a 10 sem escrever explicitamente todos os números e atribua para o objeto sequencia.
vetor <- seq(1:10)

#Matrizes
#1 - Crie 2 vetores numéricos com 5 elementos cada
#e, posteriormente, crie uma matriz juntando os 2 vetores criados e formando uma matriz com 2 colunas e 5 linhas.

aa <- seq(from=20, to=100, by = 20)
bb <- c(5,6,7,8,9)
cc <- matrix(cbind(aa,bb), nrow = 5, ncol = 2)

#Listas
#1 - Crie uma lista contendo uma matriz com pelo menos 2 vetores.
#Adicione no segundo elemento da sua lista um vetor de texto, com quantos elementos você quiser.
list(cc, texto)

#Coerção de Classes
#1 - Execute o seguinte código no seu console:
#Verifique qual a classe do objeto profissao.
#Transforme o objeto profissao para fator.

profissao <- c("cientista","analista","jogador")
class(profissao) #character
profissao <- factor(profissao)
class(profissao) #factor

#Data Frames
#1 - Crie um Data Frame com uma coluna da classe numeric, uma coluna da classe logical e outra coluna da classe character.

#2 - Altere apenas o nome da 2ª coluna do seu data frame.
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

#3 - Instale a biblioteca rCharts usando a função "install_github".
#Dica para a instalação: Consulte o repositório https://github.com/ramnathv/rCharts#installation
install_github("ramnathv/rCharts")
library(rCharts)

#Importação de Dados
#1 Importe o conjunto de dados:
#Quando você acessar o link abaixo, ele irá fazer o download de uma tabela no formato csv.
#https://people.sc.fsu.edu/~jburkardt/data/csv/addresses.csv
#Faça a leitura do arquivo csv baixado no item "a" usando o botão "import dataset".
#obs.: se atente para qual pasta o arquivo foi baixado e qual a pasta está o seu projeto.


###########################################################################################
##########################################################################################
##############################################################

#Manipulação de Vetores
#1 - Execute o seguinte código:
#Extraia o elemento 10 de seu vetor.
vetor<-21:30
vetor[10]

#Extraia os elementos 2 e 5 (em um só comando) de seu vetor.
vetor[c(2,5)]

#Manipulação de Matrizes
#1 - Execute o seguinte código:
#Extraia o segundo elemento da terceira coluna
    
matriz<- matrix(201:212,nrow=3,ncol=4)
matriz[2,3]

#Extraia a terceira coluna de sua matriz.
matriz[,3]

#Atribua o valor 500 para o último elemento da primeira coluna.
matriz[3,1] <- 500

#Manipulação de listas
#1 Manipule uma lista:
#Crie uma lista com 3 elementos (um vetor numérico, um vetor de texto e uma matriz com 3 linhas e 4 colunas).
vn <- seq(from=0, to=30, by= 5)
vt <- c("a", "b", "c", "d")
vm <- matrix(201:212,nrow=3,ncol=4)
lista <- list(vn, vt, vm)

#Faça a extração do valor correspondente a segunda linha e terceira coluna de sua matriz contida na lista.
lista[[3]][2,3]


#Manipulação de Data Frames com a biblioteca Dplyr
#1 - Desenvolva os itens a seguir:
    
#Carregue a biblioteca dplyr
library(dplyr)

#Selecione as colunas "Day" e "Ozone" do conjunto de dados airquality usando a função select.
air <- airquality
names(air)
select(air, Day, Ozone)

#Filtre as observações da segunda quinzena de cada mês usando a função filter (para o mesmo conjunto de dados airquality).
filter(air, Day>15)

#Repita os dois itens acima, porém agora usando o operador %>% (pipe).
names(air)
air %>% select(Day, Ozone)
air %>% filter(Day>15)

#Para o conjunto de dados airquality completo, calcule a média da variável "Wind" para cada mês. Use as funções group_by e summarise.
air %>% group_by(Month) %>% summarise(media= mean(Wind))

#Para o conjunto de dados airquality completo, calcule a média da variável "Solar.R" para cada mês. Use as funções group_by e summarise.
#Dica: Nesse caso você precisará definir na função mean que deseja ignorar valores faltantes da variável "Solar.R".
air <- na.omit(airquality)
air %>% group_by(Month) %>% summarise(media=mean(Solar.R)) 

#Crie uma nova coluna usando a função mutate com o valor da variável "Wind" dividida pela variável "Temp".
air %>% mutate(nova_coluna=Wind/Temp)

#Ordene o conjunto de dados airquality começando pelas maiores temperaturas (variável "Temp") e, caso haja empate entre as temperaturas, ordene em ordem crescente pela variável "Solar.R". Para isso, use a função arrange.
air %>% arrange(-Temp,Solar.R)

#Renomeie a variável "Temp" (usando a função rename) para "temperatura" no conjunto de dados airqulity.
air %>% rename(temperatura=Temp)

#2 - Execute o seguinte código:
    
preco_iris<- data.frame(Species=c("setosa","virginica","versicolor"),preco=c(5,10,15))
#Junte a tabela preco_iris com a tabela nativa do R iris usando a variável "Species" como chave.
library(plyr)
junta <- join(iris, preco_iris, by= "Species")
junta

#Manipulação de Data e Hora
#1 - Execute o código:
    
    Data1<-"05-03-2021 14:43:12"

Data2<-"10 Janeiro 2021"

#Verifique a classe dos objetos Data1 e Data2
class(Data1) #character
class(Data2) #character

#Transforme os objetos Data1 e Data2 para o formato de data padrão do R usando a função strptime. Atribua os resultados para os objetos Data1t e Data2t.
Data1
Data1t <- strptime(Data1, format = "%d-%m-%Y %H:%M:%S")
Data2t <- strptime(Data2, format = "%d %B %Y") #mês extenso %B
class(Data1t)
class(Data2t)

#Extraia apenas a data do objeto Data1t (sem as horas).
format(Data1t, "%d-%m-%Y")

#Extraia apenas o ano do objeto Data2t.
format(Data2t, "%Y")

#Estruturas de Controle
#1 - Execute o seguinte código:
    
Vetor1<-1:50
Vetor2<-c()

#Usando a função for, atribua para cada elemento "n" do vetor2 a soma acumulada no Vetor1 de primeiro elemento até o seu elemento n.
#vetor so um []; lista dois [[]]

for(i in 1:50){ Vetor2 <- cumsum(Vetor1)
}
Vetor2
#2 - Faça um looping usando a função while que gere um valor aleatório seguindo a distribuição uniforme
#com limites 0 e 1 e imprima o valor gerado no console.
#O looping deve ser executado até um valor maior que 0.95 ser gerado.

##################################################################################################
##################################################################################################
i <-list()
while(i <=0.95) { i=rnorm(runif(1,min=0, max=10))
     print(i)}

#3 - Crie um looping usando a função for e 10 ciclos. #Ex: for( i in 1:10). 
#Dentro desse looping, gere um valor aleatório seguindo uma distribuição normal padrão 
#(média 0 e desvio padrão 1). Se o valor for maior que 0, imprima o texto "positivo". 
#Caso contrário, imprima "negativo".

lista2 <- list()
for(i in 1:10) {lista2 [[i]] <- rnorm(10,mean = 0, sd = 1) 
    lista2[[i]] <- ifelse (lista2[[i]]>0, "positivo", "negativo")}
    
#4 - Usando o conjunto de dados "airquality" e a função "ifelse", 
#crie uma nova coluna no conjunto de dados com os valores "ventao",
#caso o valor de "Wind" seja maior (>) que 10 ou "ventinho", 
#caso o valor de "Wind" seja menor ou igual (<=) a 10.

air <- airquality
air %>% mutate(vento= ifelse (Wind > 10, "ventao", "ventinho"))

#Análise Exploratória
#1 - Faça uma análise exploratória com o conjunto de dados iris:
    
#Imprima o cabeçalho e o rodapé do conjunto de dados.
head(iris)
tail(iris)

#Verifique a estrutura dos seus dados. Descubra quais as classes de cada variável e as dimensões de seu conjunto de dados.
#Dica: faça isso usando apenas uma função.
str(iris)

#Usando apenas uma função, calcule estatísticas descritivas (média, mediana e quartis) das variáveis numéricas e a frequência das observações para a variável categórica.
summary(iris)

#Calcule a frequência da variável "Species" usando a função table e usando a função count da biblioteca dplyr
table(iris$Species)
count(iris$Species)

#Faça um boxplot da variável "Petal.Length" e interprete o seu boxplot. Onde há concentração de dados?
library(ggplot2)
names(iris)

ggplot(iris, aes(x=factor(Species), y=`Petal.Length`)) +
    geom_boxplot()
#menor petal length

#For vs lapply
#1 - Execute o código abaixo:
    
#lista_exercicio<-list() # Cria uma lista vazia e atribui para o objeto lista_exercicio
#for(elemento in 1:10){ #looping com 1 milhão de repetições
#    lista_exercicio[[elemento]]<-rnorm(runif(1,min = 1,max=20))
    #para cada elemento da lista é gerado um vetor com distribuição normal (rnorm) e comprimento variando entre 1 e 20, definido pela distribuição uniforme (runif).
#}
#head(lista_exercicio)
#Usando a função for, 
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

#Usando a função lapply, calcule o comprimento de cada elemento da lista lista_exercicio e 
#atribua o resultado para o objeto lista_comprimento_lapply.
lista_exercicio<-list()
lista_comprimento_lapply <- list()
for(elemento in 1:10){
    lista_exercicio[[elemento]]<-rnorm(runif(1,min = 1,max=20))}

lista_comprimento_lapply <- lapply(lista_exercicio, length)    
head(lista_comprimento_lapply)
head(lista_exercicio)

 


#Para calcular o tempo que cada script demorou para ser executado, use a função Sys.time().

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

#Criando uma função na linguagem R
# - Crie uma função chamada media_coluna. A função deverá receber um data.frame 
#com colunas numéricas e calcular as médias para cada coluna. 
#O resultado da função deve ser um vetor com comprimento igual ao número de colunas do data frame.

#Obs: é possível usar a função for ou apply para resolver o exercício.

#Desafio: Adicione na função acima os itens abaixo:
    
#    uma mensagem caso o input (argumento de entrada) da função não seja um data frame.

#Caso o data frame tenha uma variável que não é numérica, coloque o valor NA como resultado da média 
#para a coluna.

iris
str(iris)
media_coluna <- function (dados) {apply(data.frame,2, mean)} 
media_coluna(iris)