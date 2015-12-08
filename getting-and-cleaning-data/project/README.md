# Getting and Cleaning Data Course Project
This repository contains the project for the Getting and Cleaning Data Course by Cousera.
The main file is called [run_analysis.R](run_analysis.R) which will read all the raw data files and will output a tidy data set.

For details about the variables, refer to [CodeBook.md](CodeBook.md)
## Required R Packages
```
install.packages("data.table")
install.packages("dplyr")
install.packages("reshape2")
```
## Data files used

The raw data comes from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and can be downloaded at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Running the script

Extract the zip into the ```./data``` directory and run [run_analysis.R](run_analysis). Once run the results will be in the ```./data/tidy_data.txt```
