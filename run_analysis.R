##  Download original data set to working directory:
##      https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip



##	1.	Merges the training and the test sets to create one data set.

#		Remark: This is computationally heavy.

feat <- read.table(file="./features.txt")
test <- cbind(
            read.table(file="./test/X_test.txt", col.names = feat[,2]),
            read.table(file="./test/y_test.txt", col.names = "activity"),
            read.table(file="./test/subject_test.txt", col.names = "subject")
        )
train<- cbind(
            read.table(file="./train/X_train.txt", col.names = feat[,2]),
            read.table(file="./train/y_train.txt", col.names = "activity"),
            read.table(file="./train/subject_train.txt", col.names = "subject")
        )
data <-	rbind(test,train)


##	2.	Extracts only the measurements on the mean and standard deviation for
##      each measurement. 

index<-	c(
			sort(c(
					grep("mean()",feat[,2],fixed=T),
					grep("std()",feat[,2],fixed=T)
				)),
		match("activity",names(data)),
		match("subject",names(data))
		)
data<-	data[,index]



##	3.	Uses descriptive activity names to name the activities in the data set

actv <- read.table(file="./activity_labels.txt")
data$activity<- actv[data$activity,2]



##	4.	Appropriately labels the data set with descriptive variable names. 

#	Remark: This is addressed in part 1.



##	5.	From the data set in step 4, creates a second, independent tidy data set
##      with the average of each variable for each activity and each subject.

#	Remark: Due to the ambiguity of this instruction, please see the code book
# 	for information on the structure of this output.

tidy <- cbind(data[1:180,68:67],data[1:180,1:66])

for (i in 1:length(unique(data$subject))) {
    for (j in 1:length(unique(data$activity))) {
        k <- 6*(i-1)+j
        tidy[k,1] <- unique(data$subject)[i]
        tidy[k,2] <- as.character(actv[j,2])
        x <- data[data$subject==i & data$activity==actv[j,2],]
		tidy[k,3:68] <- colMeans(x[,1:66])
    }
}

ordered <-	tidy[order(tidy$subject,tidy$activity),]
write.table(ordered, "tidy_data.txt",row.name=FALSE)





