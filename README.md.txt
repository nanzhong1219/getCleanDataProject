****This brief description of what the run_analysis.R would do, please read it carefully before you execute the code.****

**Purpose: There are two main purpose of this script.
(1) read the scattered data from original unstructured text files, combine them together into a meaningful well structured table
(2) get a tidy dataset by aggregating the structured table with two categorical fields

**How to use it?
1) open download.R, set the working directory as where this README.md file is located by editing the first line of run_analysis (setwd("/yourDirectory") 
2) run the download.R to download raw data from web
3) open the run_analysis.R with R 3.1.1 (or above)
4) set working directory to be yourDirectory/UCI HAR Dataset/ (setwd("yourDirectory/UCI HAR Dataset/") 
5) make sure you have "data.table" r library installed, o.w., run install.packages("data.table") on your console first
6) run the run_analysis.R

**what's the output file? What do those varible names mean?
This script deals with dataset analyzing human activity recognition using smartphone motion sensors. Each record in the output file (tidy_dataSet) is an average of all the velocity/acceleration feature variable for a specific subject/activity combination. The script specificly select feature with name "mean" and "std" included among all 561 original feature vectors. 
Note: some feature 

**Detail information:
1.For explanation of the raw datas, please see README_original
2.For description of each variable names, please see features_info






