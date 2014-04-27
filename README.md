### Getting and Cleaning data
#### Coursera Project
##### April 2014

In run_analysis.R is a function called "dela" which create everything what project require from us:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.  

##### Input variables:

> dela <- function(dataSourceDir="data", dataFileName="CourProjData.txt", meanFileName="CourProjGroupByData.txt")

* dataSourceDir -- directory for input and output data
* dataFileName -- file name for a merging data set (test and training data)
* meanFileName -- file name for a independant tidy data set

##### Default values are:

* dataSourceDir -- "data"
* dataFileName -- "CourProjData.txt"
* meanFileName -- "CourProjGroupByData.txt"

##### Structure of input and output data:

Input data:

* dataSourceDir/features.txt
* dataSourceDir/activity_labels.txt
* dataSourceDir/test/subject_test.txt
* dataSourceDir/test/x_test.txt
* dataSourceDir/test/y_test.txt
* dataSourceDir/train/subject_train.txt
* dataSourceDir/train/x_train.txt
* dataSourceDir/train/y_train.txt

Output data:
* dataSourceDir/dataFileName
* dataSourceDir/meanFileName

##### How to use:

Load function to R or RStudio:
> source("run_analysis.R")

Run the function "dela":
> dela()

Or:
> dela("original_data","FirstSet.txt","SecondSet.txt")

##### Function procedure:

* FEATURES AND ACTIVITY LABELS
* reading features and activity labels - read.table function
* creating filter (cv) for reading only std() and mean() data - combination sapply, grepl and ifelse functions. Result is a 561 length vector with appropriate values

* TEST DATA
* reading all test data applying filter (cv) and creating names for all variables. Names are created from feature data names with some rules. Naming rules are described in the last part of this document in CodeBook section. 
* doubling variable ActivityCode and changing name to ActivityName (both variables are preserved) - names function.
* binding all test data together - cbind function
* changing test ActivityCode to ActivityName

* TRAINING DATA
* reading all training data applying filter (cv) and creating names for all variables. Names are created from feature data names with some rules. Naming rules are described in the last part of this document in CodeBook section. 
* doubling variable ActivityCode and changing name to ActivityName (both variables are preserved) - names function.
* binding all training data together - cbind function
* changing training ActivityCode to ActivityName

* ALL DATA
* binding test and training data together - rbind function

* SECOND DATA SET 
* creating second data set with the average of each variable for each activity and each subject - function aggregate

* WRITING DATA 
* writing data to files
* printing a mesage for written files

#### Code Book
Names of variables are created from features (feature.txt) and they are automaticaly converted acoording to following table below. I think that any other description can create more confusion in understanding data.
<table>
<tr><td>Merging training and test data set variables</td><td>Original variablaes</td></tr>
<tr><td>Subject - number of subject</td><td></td></tr>
<tr><td>ActivityCode - Number from 1 - 6 - according to activity name</td><td></td></tr>
<tr><td>ActivityName - Activity name (list of codes at the end)</td><td></td></tr>
<tr><td>tBodyAcc.mean...X</td><td>tBodyAcc-mean()-X</td></tr>
<tr><td>tBodyAcc.mean...Y</td><td>tBodyAcc-mean()-Y</td></tr>
<tr><td>tBodyAcc.mean...Z</td><td>tBodyAcc-mean()-Z</td></tr>
<tr><td>tBodyAcc.std...X</td><td>tBodyAcc-std()-X</td></tr>
<tr><td>tBodyAcc.std...Y</td><td>tBodyAcc-std()-Y</td></tr>
<tr><td>tBodyAcc.std...Z</td><td>tBodyAcc-std()-Z</td></tr>
<tr><td>tGravityAcc.mean...X</td><td>tGravityAcc-mean()-X</td></tr>
<tr><td>tGravityAcc.mean...Y</td><td>tGravityAcc-mean()-Y</td></tr>
<tr><td>tGravityAcc.mean...Z</td><td>tGravityAcc-mean()-Z</td></tr>
<tr><td>tGravityAcc.std...X</td><td>tGravityAcc-std()-X</td></tr>
<tr><td>tGravityAcc.std...Y</td><td>tGravityAcc-std()-Y</td></tr>
<tr><td>tGravityAcc.std...Z</td><td>tGravityAcc-std()-Z</td></tr>
<tr><td>tBodyAccJerk.mean...X</td><td>tBodyAccJerk-mean()-X</td></tr>
<tr><td>tBodyAccJerk.mean...Y</td><td>tBodyAccJerk-mean()-Y</td></tr>
<tr><td>tBodyAccJerk.mean...Z</td><td>tBodyAccJerk-mean()-Z</td></tr>
<tr><td>tBodyAccJerk.std...X</td><td>tBodyAccJerk-std()-X</td></tr>
<tr><td>tBodyAccJerk.std...Y</td><td>tBodyAccJerk-std()-Y</td></tr>
<tr><td>tBodyAccJerk.std...Z</td><td>tBodyAccJerk-std()-Z</td></tr>
<tr><td>tBodyGyro.mean...X</td><td>tBodyGyro-mean()-X</td></tr>
<tr><td>tBodyGyro.mean...Y</td><td>tBodyGyro-mean()-Y</td></tr>
<tr><td>tBodyGyro.mean...Z</td><td>tBodyGyro-mean()-Z</td></tr>
<tr><td>tBodyGyro.std...X</td><td>tBodyGyro-std()-X</td></tr>
<tr><td>tBodyGyro.std...Y</td><td>tBodyGyro-std()-Y</td></tr>
<tr><td>tBodyGyro.std...Z</td><td>tBodyGyro-std()-Z</td></tr>
<tr><td>tBodyGyroJerk.mean...X</td><td>tBodyGyroJerk-mean()-X</td></tr>
<tr><td>tBodyGyroJerk.mean...Y</td><td>tBodyGyroJerk-mean()-Y</td></tr>
<tr><td>tBodyGyroJerk.mean...Z</td><td>tBodyGyroJerk-mean()-Z</td></tr>
<tr><td>tBodyGyroJerk.std...X</td><td>tBodyGyroJerk-std()-X</td></tr>
<tr><td>tBodyGyroJerk.std...Y</td><td>tBodyGyroJerk-std()-Y</td></tr>
<tr><td>tBodyGyroJerk.std...Z</td><td>tBodyGyroJerk-std()-Z</td></tr>
<tr><td>tBodyAccMag.mean..</td><td>tBodyAccMag-mean()</td></tr>
<tr><td>tBodyAccMag.std..</td><td>tBodyAccMag-std()</td></tr>
<tr><td>tGravityAccMag.mean..</td><td>tGravityAccMag-mean()</td></tr>
<tr><td>tGravityAccMag.std..</td><td>tGravityAccMag-std()</td></tr>
<tr><td>tBodyAccJerkMag.mean..</td><td>tBodyAccJerkMag-mean()</td></tr>
<tr><td>tBodyAccJerkMag.std..</td><td>tBodyAccJerkMag-std()</td></tr>
<tr><td>tBodyGyroMag.mean..</td><td>tBodyGyroMag-mean()</td></tr>
<tr><td>tBodyGyroMag.std..</td><td>tBodyGyroMag-std()</td></tr>
<tr><td>tBodyGyroJerkMag.mean..</td><td>tBodyGyroJerkMag-mean()</td></tr>
<tr><td>tBodyGyroJerkMag.std..</td><td>tBodyGyroJerkMag-std()</td></tr>
<tr><td>fBodyAcc.mean...X</td><td>fBodyAcc-mean()-X</td></tr>
<tr><td>fBodyAcc.mean...Y</td><td>fBodyAcc-mean()-Y</td></tr>
<tr><td>fBodyAcc.mean...Z</td><td>fBodyAcc-mean()-Z</td></tr>
<tr><td>fBodyAcc.std...X</td><td>fBodyAcc-std()-X</td></tr>
<tr><td>fBodyAcc.std...Y</td><td>fBodyAcc-std()-Y</td></tr>
<tr><td>fBodyAcc.std...Z</td><td>fBodyAcc-std()-Z</td></tr>
<tr><td>fBodyAccJerk.mean...X</td><td>fBodyAccJerk-mean()-X</td></tr>
<tr><td>fBodyAccJerk.mean...Y</td><td>fBodyAccJerk-mean()-Y</td></tr>
<tr><td>fBodyAccJerk.mean...Z</td><td>fBodyAccJerk-mean()-Z</td></tr>
<tr><td>fBodyAccJerk.std...X</td><td>fBodyAccJerk-std()-X</td></tr>
<tr><td>fBodyAccJerk.std...Y</td><td>fBodyAccJerk-std()-Y</td></tr>
<tr><td>fBodyAccJerk.std...Z</td><td>fBodyAccJerk-std()-Z</td></tr>
<tr><td>fBodyGyro.mean...X</td><td>fBodyGyro-mean()-X</td></tr>
<tr><td>fBodyGyro.mean...Y</td><td>fBodyGyro-mean()-Y</td></tr>
<tr><td>fBodyGyro.mean...Z</td><td>fBodyGyro-mean()-Z</td></tr>
<tr><td>fBodyGyro.std...X</td><td>fBodyGyro-std()-X</td></tr>
<tr><td>fBodyGyro.std...Y</td><td>fBodyGyro-std()-Y</td></tr>
<tr><td>fBodyGyro.std...Z</td><td>fBodyGyro-std()-Z</td></tr>
<tr><td>fBodyAccMag.mean..</td><td>fBodyAccMag-mean()</td></tr>
<tr><td>fBodyAccMag.std..</td><td>fBodyAccMag-std()</td></tr>
<tr><td>fBodyBodyAccJerkMag.mean..</td><td>fBodyBodyAccJerkMag-mean()</td></tr>
<tr><td>fBodyBodyAccJerkMag.std..</td><td>fBodyBodyAccJerkMag-std()</td></tr>
<tr><td>fBodyBodyGyroMag.mean..</td><td>fBodyBodyGyroMag-mean()</td></tr>
<tr><td>fBodyBodyGyroMag.std..</td><td>fBodyBodyGyroMag-std()</td></tr>
<tr><td>fBodyBodyGyroJerkMag.mean..</td><td>fBodyBodyGyroJerkMag-mean()</td></tr>
<tr><td>fBodyBodyGyroJerkMag.std..</td><td>fBodyBodyGyroJerkMag-std()</td></tr>
</table>

##### Activities names:
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

##### Original dataset license:

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

