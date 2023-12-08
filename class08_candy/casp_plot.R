f <- "/Users/barry/Dropbox/Teaching/UCSD/BGGN213_W23/Labs/lab9/casp14.csv"
casp <- read.csv(f, row.names = 1)

library(ggplot2)

ggplot(casp[1:50,]) +
  aes(zscore, reorder(name, zscore)) +
  geom_col() +
  theme_bw() +
  xlab("Performance (Zscore)") +
  ylab("")

mycols <- rep("gray40", 50)
mycols[1] <- "red"
mycols[2:3] <- "orange"

ggplot(casp[1:50,]) +
  aes(zscore, reorder(name, zscore)) +
  geom_segment(aes(yend = reorder(name, zscore), 
                 xend = 1), col=mycols) +
  geom_point(col=mycols) +
  #theme_bw() +
  theme(axis.ticks.y = element_blank()) +
  #labs(title="CASP14 Results Summary", 
  #     caption="Data from https://predictioncenter.org/casp14/zscores_final.cgi")
  xlab("Performance (Zscore)") +
  ylab("") +
  scale_x_continuous(expand = c(0, 0), limits = c(1, 255)) 
  



## Now the other way around

ggplot(casp[1:50,]) +
  aes(reorder(name, -zscore), zscore, ) +
  geom_segment(aes(yend = 1, 
                   xend = reorder(name, -zscore)), col=mycols) +
  geom_point(col=mycols) +
  theme(axis.text.x = element_text(angle = 90, hjust=1,vjust=0.2),
        axis.ticks.x = element_blank()) +
  ylab("Performance (Zscore)") +
  xlab("") +
  scale_y_continuous(expand = c(0, 0), limits = c(1, 255)) 

  


