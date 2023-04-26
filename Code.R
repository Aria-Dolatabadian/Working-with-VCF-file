library(vcfR)

#Generating Example

# Add the c() function to make 
## vectors containing SNP genotypes

SNP01 <- c("A|A","A|A","A|A","A|A") # TODO
SNP02 <- c("G|G","G|G","G|G","G|G")

# add the rbind() function
## to combine the vectors into a dataframe

my_matrix <- rbind(SNP01, SNP02) # TODO

# add the colnames() function around
## the my_matrix object to 
## rename it

colnames(my_matrix) <- c("sample1",  # TODO
                         "sample2",
                         "sample3", 
                         "sample4")

# add the my_matrix object to the chunk so
## its contents are shown

 # TODO

# add the t() function to transpose
## the matrix

t(my_matrix) # TODO

# add the t() function and assign
## the output to an object called
## my_matrix_t

my_matrix_t <- t(my_matrix) # TODO

# add the data.frame() function to 
## turn my_matrix into a dataframe
## and assign it to an object called my_df

my_df <- data.frame(my_matrix) # TODO

# add the t() function to show the flipped
## dataframe
t(my_df) # TODO


write.csv(t(my_df), "my_vcf_file.csv")






#Worked example

bird_snps <- vcfR::read.vcfR("aphelocoma.vcf",
                             convertNA = T) #TODO



#Examine the VCF file

# run head() on bird_snps
head(bird_snps)           # TODO


bird_snps@meta


bird_snps@gt[1:10, 1:3]



#Extract numeric genotype scores


# Add vcfR::extract.gt() to extract the
## numeric scores 
bird_snps_num <- vcfR::extract.gt(bird_snps, # TODO
           element = "GT",
           IDtoRowNames  = F,
           as.numeric = T,
           convertNA = T)


colnames(bird_snps_num) <-  gsub("sample_", "",
                                 colnames(bird_snps_num))

colnames(bird_snps_num) <-  gsub("_", "",
                                 colnames(bird_snps_num))

bird_snps_num[1:10, 1:4]

summary(bird_snps_num[, 1:5])

#Transpose numeric genotype scores

# run t() on bird_snps_num and 
## save the output to bird_snps_num_t

bird_snps_num_t <- t(bird_snps_num) # TODO

bird_snps_num_t[1:10, 1:4]

#Preview - dealing iwth NAs


# Call na.omit() on bird_snps_num_t
## and assign the output to no_NAs
no_NAs <- na.omit(bird_snps_num_t) # TODO

# what is the remaining size of the data?
# why: So much snp data with more samples snps than samples means most snps have at least one missing specimen
dim(no_NAs)










