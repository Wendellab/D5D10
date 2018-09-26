library(dplyr)

genomes <- read.table("genomes.summary", sep = "\t", header=T)

genomes[is.na(genomes)] <- 0
TEsummary <- genomes %>%
    group_by(Genome,Family) %>%
    summarise(Fragments=sum(Fragments),Copies=sum(Copies),Total_Mb=sum(Total_Bp)/1000000,Coverage=mean(Cover))

TEdata <- as.data.frame(TEsummary %>% print(n = Inf))

write.table(TEdata, file = "TE.data", sep = "\t", col.names = T, quote = FALSE)
