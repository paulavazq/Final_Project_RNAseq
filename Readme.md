CAS Applied Data Science 2023-2024 

Final Report

This repository contains the data and notebooks used for the project: 

# Prostate Cancer Prediction and Biomarker Identification Using Machine Learning and Deep Learning Algorithms on Transcriptome Data from The Cancer Genome Atlas (TCGA) Database

# DESCRIPTION:

The search for novel RNA biomarkers in cancer and innovative methods to identify cancerous tissues can significantly advance the development of RNA-based diagnostic and therapeutic strategies, leading to more effective and personalized approaches for cancer treatment and management. In this project, I investigated the feasibility of predicting or diagnosing prostate cancer, which ranks among the most prevalent cancers in the male population, by applying machine learning (ML) and convolutional neural network (CNN) algorithms to gene expression data of normal and primary tumor prostate gland samples.
Genes/features used as input for ML were reduced by preselecting the most differentially expressed (DE) genes between cancer and normal samples. Machine learning algorithms (logistic regression, random forest, random forest on the most important principal components) were applied to predict cancer outcomes using gene expression tabular data on the selected genes. A CNN was also tested on the same tabular data converted to images. 
Moreover, through an examination of the disturbed gene expression patterns in prostate cancer samples and the genes important for predicting cancer versus normal tissue outcomes by machine learning, I also set up to discover putative novel RNA biomarkers for prostate cancer. Gene Ontology analysis of these genes and the DE genes was also conducted to enhance our comprehension of the pathways disrupted or contributing to disease progression.


# RESULTS:

<img width="771" alt="image" src="https://github.com/user-attachments/assets/153194d4-5c19-46de-8510-ea9fd2da4bc4" />


# CONCLUSIONS:

- Machine learning applied to RNAseq successfully predicted prostate cancer outcomes.
- Random forest outperformed logistic regression, enhancing recall for under-represented normal tissue.
- PCA feature reduction was effective; 2 PCs matched RF performance with 1,380 features.
- Transforming tabular data into images for a CNN improved model performance, particularly recall for the underrepresented category; visualization provided insights not easily discernible from 1,380 tabular features.
- Main issues: unbalanced, limited data and no accessible independent dataset for final validation. While models showed high accuracy, they struggled with underrepresented normal samples but excelled in classifying tumor samples.
- Stratified splitting improved Random Forest performance on underrepresented samples. Further enhancement of CNN could be achieved with stratification and cross-validation.
- Known and novel Stratified splitting improved Random Forest performance on underrepresented samples. Further enhancement of CNN could be achieved with stratification and cross-validation.
- known and novel prostate cancer biomarkers could be identify by anaylsing feature importance for prostate cancer prediction by the random forest algorithm.

#SKILLS:

Python, Scikit-learn, Pandas, Numpy, Matplotlib, Seaborn, Biophyton, Classification, Regression,  Random Forest, Convolutional Neural Networks (CNN), pyDeseq2, ClusterProfiler (R), pyTorch, PCA analysis, SHAP, Gini, importance anaylsis.

#Link to the Publication Report:
Includes the project report text and figures. (https://github.com/paulavazq/Final_Project_RNAseq/blob/main/CAS_Final_Project_Report_Paula_Vazquez.pdf)

# Link to the Poster with main results:
[CAS_ADS_Poster_Paula_Vazquez_A3.pdf](https://github.com/user-attachments/files/19851543/CAS_ADS_Poster_Paula_Vazquez_A3.pdf)


## MAIN CONTENTS OF THE REPOSITORY:

### DataMiner_main Folder

This folder contains the following:

-   **Notebooks**: Data_Retrieval_TCGA_Downloader.ipynb to retrieve the data using the tcga_downloader and the manifest file. (https://github.com/paulavazq/Final_Project_RNAseq/blob/main/DataMiner-main/Data_Retrieval_Tcga%20_Downloader.ipynb)

-   **Python Scripts**: tcga_downloader py script (from:https://github.com/vappiah/DataMiner, Author: Vincent Vappiah (2021). (https://github.com/paulavazq/Final_Project_RNAseq/blob/main/DataMiner-main/tcga_downloader.py)

-   **Manifest File**: Used to retrieve the RNA-seq data for prostate cancer (PRAD) from the TCGA database (https://github.com/paulavazq/Final_Project_RNAseq/blob/main/DataMiner-main/gdc_manifest.2023-10-25-PRAD.txt)

-   **Retrieved Original Data**: Original PRAD data and metadata (PRAD folder and in Drive folders: <https://drive.google.com/drive/folders/1xKBVx3REC8ilCC9hjMq0OAm0Wo6_dbT2?usp=sharing>).

-   **Generated Output**: Results from the pyDeseq2 analysis. This include several tables including the generated input data for ML (PRAD_ML_df_gene_names.csv). (inside the PRAD sub folder). Link to the zip file: https://drive.google.com/drive/folders/1xKBVx3REC8ilCC9hjMq0OAm0Wo6_dbT2?usp=sharing.

### Notebooks and Scripts

-   **Data_Preparation_DE_ML_and_DE_analysis_Final.ipynb**:
(https://github.com/paulavazq/Final_Project_RNAseq/blob/main/Data_Preparation_DE_ML_and_DE_analysis_Final.ipynb)

    -   Prepares data for differential expression (DE) analysis.

    -   Performs DE analysis with pyDeseq2, filters results, and visualizes the DE analysis.

    -   Prepares data for applying machine learning (ML) algorithms with the filtered data.

-   **Random_Forest_PCA_Linear_Regression_Important_Features_PubMed_Final.ipynb**:
  (https://github.com/paulavazq/Final_Project_RNAseq/blob/main/Random_Forest_PCA_Linear_regression_Important_Features_Pub_Med.ipynb)

    -   Applies logistic regression and random forest to PRAD data.

    -   Computes feature importances (Gini, SHAP, permutation importances).

    -   Generates Venn diagrams of common features and retrieves PubMed info for selected genes.

-   **GO_analysis_human_genes.R**:
  (https://github.com/paulavazq/Final_Project_RNAseq/blob/main/GO%20analysis_human_genes.R)

    -   Performs Gene Ontology analysis on selected gene lists for human genes using R.

-   **IGTD_Tabular_data_to_images.ipynb**:
   (https://github.com/paulavazq/Final_Project_RNAseq/blob/main/IGTD_Tabular_data_to_images.ipynb)

    -   Converts tabular data into images using the IGTD.

-   **CNN_collab_final.ipynb**:
  (https://github.com/paulavazq/Final_Project_RNAseq/blob/main/CNN_collab_final.ipynb)

    -   Applies convolutional neural networks (CNN) to the IGTD-generated images.

    -   Designed to run in Google Colab.

### Other Contents



-   **IGTD Folder**: Contains the scripts used by the IGTD algorithm. (cloned from: [https://github.com/zhuyitan/IGTD](https://github.com/zhuyitan/IGTD.) and described by Zhu Y., et al. (2021).

-   **Results Folder**: Contains the images generated by the IGTD algorithm applied to the tabular PRAD RNA-seq data. (data.zip)(https://github.com/paulavazq/Final_Project_RNAseq/tree/main/Results/Table_To_Image_Conversion/Results_IGTD_PRAD_euclidean)
