rm(list=ls())
setwd("F:/Doris/NSR/User List")

### Read and trim the data frames

Saks <- read.csv('Saks-Production-Action.csv')
Saks2 <- read.csv('SaksV2-Production-Action.csv')
O5 <- read.csv('Off5th-Production-Action.csv')
O52 <- read.csv('Off5thV2-Production-Action.csv')
LT <- read.csv('LordTaylor-Production-Action.csv')
LT2 <- read.csv('LordTaylorV2-Production-Action.csv')

Saks$banner <- rep('Saks',nrow(Saks))
Saks2$banner <- rep('SaksV2',nrow(Saks2))
O5$banner <- rep('O5', nrow(O5))
O52$banner <- rep('O5V2', nrow(O52))
LT$banner <- rep('LT', nrow(LT))
LT2$banner <- rep('LT2', nrow(LT2))

Saks <- Saks[,-c(1,2,6)]
Saks2 <- Saks2[,-c(1,2,6)]
O5 <- O5[,-c(1,2,6)]
O52 <- O52[,-c(1,2,6)]
LT <- LT[,-c(1,2,6)]
LT2 <- LT2[,-c(1,2,6)]


### Merge the data frames

full.data <- merge(Saks, Saks2,
                   by = c('First.Name', 'Last.Name'), all = TRUE)

full.data <- merge(full.data, O5,
                   by = c('First.Name', 'Last.Name'), all = TRUE)

full.data <- merge(full.data, O52,
                   by = c('First.Name', 'Last.Name'), all = TRUE)

full.data <- merge(full.data, LT,
                   by = c('First.Name', 'Last.Name'), all = TRUE)

full.data <- merge(full.data, LT2,
                   by = c('First.Name', 'Last.Name'), all = TRUE)

write.csv(full.data, 'Full list.csv')



#tab <- c('Saks','Saks2','O5', 'O5', 'LT', 'LT2')

#for (i in 1:5) {
#  full.data <- merge(x = full.data, y = data.frame(noquote(tab[i+2])),
#                    by.x = c('First.Name', 'Last.Name'),
#                    by.y = c('First.Name', 'Last.Name'), all = TRUE)
#}

