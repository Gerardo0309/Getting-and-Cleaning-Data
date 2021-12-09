#setwd("C:/Users/Gerar/Desktop/ProgrammingAssignment2/UCI HAR Dataset")
library(reshape2)


## Links the class labels with their activity name.
activity_lables <- read.table("./activity_labels.txt")[,2]
###List of all features.
features <- read.table("./features.txt")[,2]

##Extracts only the measurements on the mean and standard deviation for each measurement. 
extracted <- grepl("mean|std", features)

#Load test data
TestX <- read.table("./test/X_test.txt")
TestY <- read.table("./test/Y_test.txt")
subject_Test <- read.table("./test/subject_test.txt")

#Work Test data
names(TestX) = features
TestX = TestX[,extracted]
TestY[,2] <- activity_lables[TestY[,1]]
names(TestY) <- c("ActivityID", "ActivityLabel")
names(subject_Test) <- "Subject"

##Final test data
testdata <- cbind(as.data.table(subject_Test), TestY,TestX)

#Load train data
TrainX <- read.table("./train/X_train.txt")
TrainY <- read.table("./train/Y_train.txt")
subject_Train <- read.table("./train/subject_train.txt")

##Work train data
names(TrainX) = features
TrainX = TrainX[,extracted]
TrainY[,2] <- activity_lables[TrainY[,1]]
names(TrainY) <- c("ActivityID", "ActivityLabel")
names(subject_Train) <- "Subject"

##Final test data
traindata <- cbind(as.data.table(subject_Train), TrainY,TrainX)

#Merge data
finaldata <-  rbind(testdata,traindata)
#Appropriately labels the data set with descriptive variable names. 
ID <-   c("Subject","ActivityID", "ActivityLabel")
datalabels <- setdiff(colnames(finaldata),ID)
melteddata <- melt(finaldata, id = ID,measure.vars = datalabels)

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidydata <- dcast(melteddata , Subject + ActivityLabel ~ variable, mean)

write.table(tidydata, file = "./tidydata.txt")
