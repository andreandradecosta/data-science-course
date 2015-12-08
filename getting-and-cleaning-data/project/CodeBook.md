# Code Book

## Raw Data
The script works on the data files downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
This zip file must be extracted into ```./data``` directory.

## The Process Used
 * Read train and test data
 * Extract the variables names and activities labels
 * Combine the measurements with the subjects and activities
 * Extract only the mean() and std() variables
 * Group the data by subject and activity to calculate the mean


## Output
The results will be saved in ```./data/tidy_data.txt```. The format of this file is:
```
subject activity    measurement         mean
1       WALKING     tBodyAcc-mean()-X   0.27733076
```
 * subject - id of the subject (int)
 * activity - name of the activity. The list of the activities is obtained from ```./data/UCI HAR Dataset/activity_labels.txt```
 * measurement - variable of the raw data. From ```./data/UCI HAR Dataset/features.txt```, only the ```*mean()*``` and ```*std()*``` are used.
 * mean - mean based on the subject and activity. The units can be discovered in ```./data/UCI HAR Dataset/features_info.txt```
