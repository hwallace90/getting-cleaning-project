##working Directory should be the UCI HAR Dataset folder
setwd("C:/Users/Cubbi_000/Desktop/Coursera/getting_cleaning/project/UCI HAR Dataset")

##Read in features.txt
features <- read.table("features.txt", col.names = c("featNum", "featName"))

##Read in test data
##We know what the columns in subject_test.txt and y_test.txt represent
subject_test <- read.table("./test/subject_test.txt", col.names = "subject")
x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt", col.names = "actNum")

##Add column to subject dataset to signify it is a part of test
subject_test$test.train <- "test"

##Label the columns in x_test using features
names(x_test) <- features[,2]

##Get only those columns with mean or std, getting rid of meanFreq
x_test <- x_test[,grep("mean|std", names(x_test), value=TRUE)]
x_test <- x_test[,!grepl("meanFreq", names(x_test))]

##Combine the 3 test datasets into one with cbind
test <- cbind(subject_test, y_test, x_test)

##Read in train data
##We know what the columns in subject_train.txt and y_train.txt represent
subject_train <- read.table("./train/subject_train.txt", col.names = "subject")
x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt", col.names = "actNum")

##Add columnn to subject dataset to signify it is a part of train
subject_train$test.train <- "train"

##Label the columns in x_train using features
names(x_train) <- features[,2]

##Get only those columns with mean or std, getting rid of meanFreq
x_train <- x_train[,grep("mean|std", names(x_train), value=TRUE)]
x_train <- x_train[,!grepl("meanFreq", names(x_train))]

##Combine the 3 train datasets into one with cbind
train <- cbind(subject_train, y_train, x_train)

##rbind the test and train data
tidy_data <- rbind(test, train)

##Cleanup
rm(subject_test, x_test, y_test, test, subject_train, x_train, y_train, train, features)

##Read in activity_labels.txt
activity_labels <- read.table("activity_labels.txt", col.names = c("actNum", "actName"))

##Merge in activity labels
tidy_data <- merge(tidy_data, activity_labels, by='actNum')

##Reorder data and drop the actNum
tidy_data <- tidy_data[c(2,70,3:69)]

##Cleanup
rm(activity_labels)

##Clean up illegal characters in the variable names, and fix "BodyBody"
fix_names <-function(n){   
    n=gsub('-','.',n)          
    n=gsub('\\(','',n)
    n=gsub(')','',n)
    n=gsub('BodyBody','Body',n)
    n             
}

names(tidy_data) <- fix_names(names(tidy_data))

##Fix the order
tidy_data <- tidy_data[order(tidy_data$subject, tidy_data$actName),]
row.names(tidy_data) <- 1:nrow(tidy_data)

##Create summary dataset
tidy_sumry <- aggregate(.~subject+actName+test.train, data = tidy_data, mean)

##Fix the order
tidy_sumry <- tidy_sumry[order(tidy_sumry$subject, tidy_sumry$actName),]
row.names(tidy_sumry) <- 1:nrow(tidy_sumry)


