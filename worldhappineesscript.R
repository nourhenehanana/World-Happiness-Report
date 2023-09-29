# chargement de données
data <- read.csv("C:\\Users\\WhiteLuce SIS\\OneDrive\\if5\\analyse de données\\world-happiness-report-2021.csv")
View(data)
data
#selectionner les variables pour l'analyse

colnames(data)

data1 <- data[, c(                       
                   "Ladder.score",                            
                  "Logged.GDP.per.capita",                     
                   "Social.support",                            
                   "Healthy.life.expectancy",                   
                   "Freedom.to.make.life.choices", "Perceptions.of.corruption" )]
head(data1)

#standariser les données
data1_scaled <- scale(data1)
head(data1_scaled)

library(FactoMineR)
Result <-PCA(data1_scaled)
summary(Result)

library(factoextra)
eig.val<- get_eigenvalue(Result)
eig.val
fviz_eig(Result, addlabels = TRUE, ylim = c(0, 50))


#AFC
library(FactoMineR)
ca1<-CA(data1, graph=TRUE, ncp=2)
summary(data1)
summary(ca1, nb.dec=2,ncp=2)
fviz_screeplot (ca1, addlabels = TRUE, ylim = c(0, 50))
