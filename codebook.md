---
title: "Code Book"
author: "Nitasha"
date: "Sunday, November 23, 2014"
output: word_document
---

Code book:
This document provides information about the two tidydata sets generated using script run_analysis.R, provided in this repository.

Data sets:
The script run_analysis.R writes two datasets, tidydata1.txt and tidydata2.txt. Tidydata1.txt is the result of a cleaning and selection of the data described in Original data set. The second one, tidydata2.txt is the result of aggregation of tidydata1.txt.

Data set tidydata1:

The dataset tidydata1.txt is the result of series of actions performed on merging test and training data, renaming variable and values and subsetting original datasets from an experiment in which measurements were collected from the accelerometer and gyroscope from the Samsung Galaxy S smartphone. The data was collected for 30 subjects carrying out a variety of 6 activities. More information about the measurements in the raw dataset is best obtained from the website where the dataset was taken from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones Information about the original data is provided below.

Tidydata1.txt consists of the 10299 observations of 67 variables:

1) Variables 1 to 66 consist of variables selected from an original list of 561 variables listed in the features.txt file. More information on the features vector is available in the feature_info.txt file in the original data. 
Only the variables with the mean and sd statistics of the signals were selected. Other statistics in the original data sucj as meanFreq, mad, max, min etc were ignored. An interpretation of what these variables represent can be made using the feature_info.txt file in the original data. 

2) The 67th variable, "activity_type" denotes the activity performed by the subject. There are six activites, listed here:
WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING
STANDING
LAYING


Data set tidydata2.txt:
Tidydata2.txt consists of 180 observations of 68 variables.

To form the dataset tidydata2.txt, the following transformations were made to tidydata1.
1.Subject data from the original training and test data set was included and merged.
2.The observations from tidydata1.txt were grouped by subject and activity and then aggregated using the mean function. This yields 180 rows (30 subjects times 6 activities) and 68 columns (1 for subject, 1 for activity plus 66 aggregated features).

The variables in the dataset arew as follows:
1. Variables 1 to 66 consist of features variable as in the tidydataset1, but the values here are aggregated values for subject and activity type as stated earlier.
2. Subject type: unique ID of subjects taking part in the experiment and ranges from 1-30
3. Activity_type: The 6 activity types, same as in tidydata1

Original data set

Taken from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones:

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."

For more information read visit http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones, the website where the original data came from