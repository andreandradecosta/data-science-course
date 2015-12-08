library(data.table)
library(dplyr)
library(reshape2)

rm(list = ls())


# Loading subjects
subjects_train <- fread("data/UCI HAR Dataset/train/subject_train.txt")
subjects_test <- fread("data/UCI HAR Dataset/test/subject_test.txt")
subjects <- bind_rows(subjects_train, subjects_test)
setnames(subjects, "subject")


# Loading activities
activity_labels <- fread("data/UCI HAR Dataset/activity_labels.txt")
setnames(activity_labels, c("index", "name"))

activities_train <- fread("data/UCI HAR Dataset/train/y_train.txt")
activities_test <- fread("data/UCI HAR Dataset/test/y_test.txt")
activities <- bind_rows(activities_train, activities_test)
setnames(activities, "activity")

# Converting activities codes to labels
activities <- activities %>% mutate(activity = factor(activity, labels = activity_labels$name))


# Loading feature names
feature_names <- fread("data/UCI HAR Dataset/features.txt")
setnames(feature_names, c("index", "name"))

# Selecting only mean and std
feature_names <- feature_names %>% filter(grepl("(mean|std)\\(\\)", name))

# Loading features
features_train <- fread("data/UCI HAR Dataset/train/X_train.txt")
features_test <- fread("data/UCI HAR Dataset/test/X_test.txt")
features <- bind_rows(features_train, features_test) %>% select(feature_names$index)
setnames(features, feature_names$name)



# Merging final dataset and calculating the mean of each measurement
dataset <- bind_cols(subjects, features, activities) %>% 
    melt(id = c("subject", "activity"),variable.name = "measurement") %>% 
    group_by(subject, activity, measurement) %>% 
    summarise(mean = mean(value))


# Writing the result
write.table(dataset, file = "data/tidy_data.txt", row.names = FALSE)
