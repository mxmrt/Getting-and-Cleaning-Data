#Code Book for Getting and Cleaning Data Course Project

This Code Book provides information on the structure, contents, and layout of original and tidied data files. 

## Original Data 
The source data comes from the UCI Machine Learning Repository. A description of the original raw data can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The raw data can be downloaded [here](http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip).

The original summary of the data states;

>*The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.*
>
>*The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.*

## Code & Output

### Run Analysis script
The `run_analysis.R` script does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Outputted "tidy" Data 

The `run_analysis.R` script writes a file titled `tidy_data.txt` to the working directory. Due to the ambiguity of part 5, I searched the course forums for interpretations of this wording. There were a variety of interpretations, but the one that made most to organize the data by subject, then by activity, and then take the mean of each subjects reading for each activity. 

### Considerations & Changes

Having learned quite a bit since the original draft of this script, I have a few things I would change if I were to write this over again.

1. In lines 10 through 21, I would reorganize the column binding to place the *subject* column first, and the *activity* column second. 
2. I would remove line 62, and instead create a variable that is increments after each run of the second for loop. This was included to ensure the data was written properly, but is a bit overkill and not worth the extra computation.
3. While the outputted file is indeed "tidy," I very much like the readability of *flat tables* using the `ftable` package. I did not include code that would output this as a *flat table* simply because there would be a trade off in usability.
4. I have since learned a few methods to reduce the computations needed to complete the objectives.
