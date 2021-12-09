## Getting and Cleaning Data

# Project
You should create one R script called run_analysis.R that does the following. 

 1.   Merges the training and the test sets to create one data set.

 2.   Extracts only the measurements on the mean and standard deviation for each measurement. 

 3.   Uses descriptive activity names to name the activities in the data set

 4.   Appropriately labels the data set with descriptive variable names. 

 5.   From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# Download data
 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
 
# Go to code
[Run analysis](https://github.com/Gerardo0309/Getting-and-Cleaning-Data/blob/main/run_analysis.R)


## Explanaition of what was done
First to understand the final tidy dataset, we have to look at what is the data:
We have 2 types of information, train and test data, wich is then divaded by the activities in the Y variable and the numeric info in the X, also for both we hace the subject.
Also we hace the features file, from wich we've been asked to take only mean and standart diviation, this set contains al the labels for the numeric data.

After explaining variables, the work done was:
First open the files we'll use, and take only the mean an standart deviation from the sets.
Then we merged each type of set to it's corresponding labels in Y and in the features requested.
After we did that for both sets we merge them into a joined dataset.
Then we give name to so it'll be easear to work with.
Finally, we create a new tidy data set that contains the average of each variable for each activity and each subject.
 
