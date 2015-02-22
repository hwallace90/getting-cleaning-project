#ReadMe for Getting and Cleaning Data Project

The data comes from:
  
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
  
In this repository is a script called run_analysis.R. It will take the Samsung raw data, and turn it into 2 wide form dataframes. As stated in the script, please make your working directory the UCI HAR Dataset folder that will be in the zip folder when extracted.

The first dataframe is called tidy_data. This dataset combines all of the relevant raw data provided into one dataframe. It has 69 variables. It will tell you what subject the data cooresponds to, which activty they were participating in, whether they were part of the test or training group, and all the mean and standard deviation variables from the raw data. I chose not to include meanFreq variables in the data set, as I did not believe that was the intent of the project instructions. 

I kept the dataframe in wide form because that was what the raw data presented itself to easily be transformed into. I took the variable names from features.txt and applied them to the raw data. Transformations were made to the variable names, taking away the - and () characters as they are not legal characters in R column names. They are instead replaced with a period for the - and the ()'s were just removed. I also fixed the variables that had "BodyBody" in the name, making them just have a single "Body" to match up to the Samsung documentation on the raw data.

The second, tidy_sumry, has the average of each measurement in my tidy_data dataframe for each subject/activity combination. This dataframe will have 180 rows, made up of 6 for each subject.

I hope you feel my script is easy to understand. It has been heavily commented explaining step by step what the code is doing.  I did not follow the "order" of things asked for in the instructions, as I did not feel the order made much sense. I instead did it in my own order that felt more logical. Please do not that against me as I do not feel the order is important.

I am hoping all the codebooks I will look at are as sparse as mine.  I did not want to engage in too much busywork when the whole exercise is academic in nature and not practical, but I just wanted to capture some of the spirit of what a codebook might look like. I'm also still trying to figure out how these markdown documents work. I'm really curious to see how others made their codebooks, as I'm sure I will get some good ideas of how it can be done better.


