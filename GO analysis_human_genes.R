BiocManager::install("clusterProfiler")
BiocManager::install("clusterProfiler", force =T, dependencies =T)
BiocManager::install("org.Dm.eg.db")
install.packages("ggnewscale")
#If you don't have the scales package installed, uncomment the following line:
# install.packages( "scales" );
library( scales )
library (clusterProfiler)
#BiocManager::install("topGO")

library (topGO)
#BiocManager::install("Rgraphviz")

library (Rgraphviz)
#first check folder and files (mmar or unmark to choose)

#install.packages( "ggplot2" );
library( ggplot2 )

# change working directory depending on the file location to analyze

setwd("~/Desktop/CAS_Applied_Data_Science_Git/Final_Project/DataMiner-main/PRAD/pyDeseq2_output")

# change the file to use as source first in a to_read file"

#to_read = "DE_Genes_PRAD_filtered_padj_pval.csv"
# = "DE_Genes_PRAD_filtered_padj_pval_down.csv"
#to_read = "DE_Genes_PRAD_filtered_padj_pval_up.csv"
#to_read = "TOP_DE_genes_DF.csv"
#to_read ="TOP_DE_genes_by_padj_DF.csv"
to_read = "top_features_SHAP_test_split_DF.csv"
#to_read= "Int_all_Split_DF.csv"

data1 = read.csv(to_read, header = TRUE, sep = ",", quote = "\"",dec = ".")
head(data1)
colnames (data1)


EnsembleID =as.vector(data1$gene_id)
# neeed to remove the version IDs

# Remove the version numbers
EnsembleID <- gsub("\\..*", "", EnsembleID )


print (EnsembleID)

# GO analyis proteomic ID


#ont= "BP"

ont= "MF"
#ont="CC"

d2GO <-clusterProfiler::enrichGO (EnsembleID, "org.Hs.eg.db", keyType = "ENSEMBL",ont = ont)
print (d2GO)



# make a bar plot of the GO term enrichment
barplot(d2GO) + theme(axis.text.y = element_text(size = 6)) +ggtitle(to_read)
barplot(d2GO,showCategory = 30) + theme(axis.text.y = element_text(size = 6)) +ggtitle(to_read)
dotplot(d2GO, showCategory=20) + ggtitle(to_read) + theme(axis.text.y = element_text(size = 8))

# make  of the GO term enrichment with conections of pathwys
plotGOgraph(d2GO, firstSigNodes = 10,useInfo = "all",sigForAll = TRUE, useFullNames = TRUE)

# make  of the GO term enrichment with conections of pathwyas 
goplot(d2GO)

# simplify the nodes

d2GOsimplify =simplify(d2GO)
goplot(d2GOsimplify)
emapplot(d2GOsimplify) + ggtitle(to_read)
enrichplot::emapplot(enrichplot::pairwise_termsim(d2GOsimplify),
                          showCategory = 30, cex_label_category = 0.5) + ggtitle(to_read)


dotplot(d2GOsimplify, showCategory=20) + ggtitle(to_read) + theme(axis.text.y = element_text(size = 8))

# Construct the output file name with the format "GO_and_<original_filename>" and save the GO analyis

output_file <- paste0("GO_and_", basename(ont), basename(to_read))
output_file_path <- file.path("~/Desktop/CAS_Applied_Data_Science_Git/Final_Project/DataMiner-main/PRAD/pyDeseq2_output/", output_file)
write.csv(d2GOsimplify, file = output_file_path, row.names = FALSE)

