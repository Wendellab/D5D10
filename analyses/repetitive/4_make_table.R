library(dplyr)

#########################################################################################################################
# R version 3.4.4 (2018-03-15)
# Platform: x86_64-w64-mingw32/x64 (64-bit)
# Running under: Windows 10 x64 (build 16299)
# 
# Matrix products: default
# 
# locale:
# [1] LC_COLLATE=English_United States.1252  LC_CTYPE=English_United States.1252   
# [3] LC_MONETARY=English_United States.1252 LC_NUMERIC=C                          
# [5] LC_TIME=English_United States.1252    
# 
# attached base packages:
# [1] stats     graphics  grDevices utils     datasets  methods   base     
# 
# other attached packages:
# [1] dplyr_0.7.4
# 
# loaded via a namespace (and not attached):
# [1] compiler_3.4.4   magrittr_1.5     assertthat_0.2.0 R6_2.2.2         pillar_1.2.2     bindrcpp_0.2.2  
# [7] glue_1.2.0       tibble_1.4.2     Rcpp_0.12.16     pkgconfig_2.0.1  rlang_0.2.0      bindr_0.1.1     
#########################################################################################################################

genomes <- read.table("genomes.summary", sep = "\t", header=T)

genomes[is.na(genomes)] <- 0
TEsummary <- genomes %>%
    group_by(Genome,Family) %>%
    summarise(Fragments=sum(Fragments),Copies=sum(Copies),Total_Mb=sum(Total_Bp)/1000000,Coverage=mean(Cover))

TEdata <- as.data.frame(TEsummary %>% print(n = Inf))

write.table(TEdata, file = "TE.data", sep = "\t", col.names = T, quote = FALSE)
