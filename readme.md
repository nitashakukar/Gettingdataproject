---
title: "readme"
author: "Nitasha"
date: "Sunday, November 23, 2014"
output: word_document
---

Installation

Create a directory for this project called samsungdata and download the R script run_analysis.R to samsungdata.
Download the raw data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip to your directory file ( we are calling it samsungdata) and unzip it. 


Required Packages:

The script run_analysis.R depends on the library reshape2. If you have not installed it, you will be prompted a choice to do so.

Generating Tidy datasets:

Change the working directory in R to the installation directory (called samsungdata in the Installation section).
Source the script run_analysis.R in R: source("run_analysis.R") and execute it.
Two datasets will be written to your working directory now: tidydata1.txt and tidydata2.txt


Codebook:

Information about the datasets is provided in CodeBook.md.

Code:

The code run_analysis.R contains detailed commments explaining the steps in which the original data was transformed to the two datasets.