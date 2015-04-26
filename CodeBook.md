### Getting and Cleaning Data Course Project: Code Book
By: Chris Jensen

####Goal: 
* Practice tidying data by merging, labelling, and performing summary operations on the smartphone accelerometer data collected by Anguita, Ghio, et al. (2012)
  * See README.md (also found in this repo) for a full citation of their work.
### Final product: a table containing 180 observations (i.e., 30 Subjects X 6 Tasks), whose values represent *the mean response* across each of 79 measurements.

####Raw Data:
* /UCI HAR Dataset/features.txt
  * 561 observations of 2 variables. 0 NA values.
  * A numeric identifier and text string identifying the specific features being measured in the training and test datasets (described below).
* /UCI HAR Dataset/activity_labels.txt
  * 6 observations of 2 variables. 0 NA values.
  * A numeric identifier and a text string corresponding to one of the six types of activity being measured [factor variable].
* /UCI HAR Dataset/test/X_test.txt
  * 2947 observations of 561 variables. 0 NA values.
  * Each row corresponds to a specific subject + activity pair, whereas the columns represent a variety of specific measurements taken by these accelerometers.
* /UCI HAR Dataset/test/y_test.txt
  * 2947 observations of 1 variable. 0 NA values.
  * This observations represent the specific type of activity engaged in by the subjects, coded with integers from 1-6. The meaning of these codes is outlined in **activity_labels.txt** (see above).
* /UCI HAR Dataset/test/subject_test.txt
  * 2947 observations of 1 variable. 0 NA values.
  * This variable corresponds to the unique IDs assigned to study participants. Integer value between 1-30.
* /UCI HAR Dataset/train/X_train.txt
  * 7352 observations of 561 variables. 0 NA values.
  * (contents are as described above, in my overview of "X_test.txt.")
* /UCI HAR Dataset/train/y_train.txt
  * 7352 observations of 1 variable. 0 NA values.
  * (contents are as described above, in my overview of "y_test.txt.")
* /UCI HAR Dataset/train/subject_train.txt
  * 7352 observations of 1 variable. 0 NA values.
  * (contents are as described above, in my overview of "y_subj.txt.")


####Data Cleaning Process (Specific Steps): 
1. In reading in **features.txt** and **activity_labels.txt**, I used the strip.white=TRUE argument to trim whitespace from both variables. This was necessary, because I was planning to use these values as column headers and a factor variable (respectively).
2. The names stored in "features.txt" were then used to assign column names to X_test and X_train.
  2.1 Due to some awkwardness in R's naming conventions, it was necessary to use the **make.names()** function on these column names prior to assigning them.
  2.2 Given that these column names are already descriptive (e.g., "fBodyGyro.meanFreq"), and that they are defined in detail in the data's documentation, I felt it would be unnecessary (and possibly counterproductive) to try and modify these names.
3. Since we were only looking for information pertaining to standard deviation and mean, I used **grep** to find all of the column names that included either *std* or *mean*. I then used the result of this search to subset the train_X and test_X data tables, reducing the overall number of columns to 79.
  3.1 *Note*: Given that we were not informed about the ultimate use to which our tidy datasets would be put, I decided to err on the side of caution in this step by being as inclusive as possible with regards to those columns that would be preserved.
4. Subject, Activity, and Observations tables were merged (for both the training and test sets). Then, the training and test sets were merged.
5. Since the first two columns lacked descriptive names, I labelled them "Subject" and "Task."
6. In order to make the data more readable, the numeric codes found in the "Task" column were converted into a factor variable (using the text from the **activity_labels.txt** file).
7. The table is then grouped by Subject and Task, and the average value of each measurement is computed across these groups (reducing the 10299 original observations to a more manageable 180).

#### Variables
* "Subject" - participant ID (integer)
* "Task" - task ID (factor variable) (Possible values: LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS)
* "tBodyAcc.mean...X" ... "fBodyBodyGyroJerkMag.meanFreq.."
  * The 79 other variables represent specific first- and second-order measures taken by the cellphone accelerometers
  * All are numeric