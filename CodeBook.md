### Getting and Cleaning Data Course Project: Code Book
By: Chris Jensen

####Goal: 
* Practice tidying data by merging, labelling, and performing summary operations on the smartphone accelerometer data collected by Anguita, Ghio, et al. (2012)
  * See README.md (also found in this repo) for a full citation of their work.

#### Final product: 
A table containing 180 observations (i.e., 30 Subjects X 6 Tasks), whose values represent *the mean response* across each of 79 measurements. See: *tidy.txt*

####Raw Data:
* /UCI HAR Dataset/features.txt
  * 561 observations of 2 variables. 0 NA values.
  * A numeric identifier and text string identifying the specific features being measured in the training and test datasets (described below).
* /UCI HAR Dataset/activity_labels.txt
  * 6 observations of 2 variables. 0 NA values.
  * A numeric identifier and a text string corresponding to one of the six types of activity being measured.
* /UCI HAR Dataset/test/X_test.txt
  * 2947 observations of 561 variables. 0 NA values.
  * Each row corresponds to a specific subject + activity pair, whereas the columns represent a variety of specific measurements taken by the cellphone accelerometers.
* /UCI HAR Dataset/test/y_test.txt
  * 2947 observations of 1 variable. 0 NA values.
  * These observations represent the specific type of activity engaged in by the subjects, coded with integers from 1-6. The meaning of these codes is outlined in **activity_labels.txt** (see above).
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

#### Variables
* "Subject" - participant ID (integer (1-30))
* "Task" - task ID (factor variable) (Possible values: LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS)
  * It was necessary to trim the white-space from these values before assigning them.
  * The integer values in this column were transformed into factors for legibility.
* "tBodyAcc.mean...X" ... "fBodyBodyGyroJerkMag.meanFreq.."
  * As per the assignment guidelines, each variable was selected because its name contained either *std* or *mean*.
  * The 79 other variables represent the *calculated averages* of specific first- and second-order measures taken by the cellphone accelerometers.
  * These averages were calculated after employing the **group_by** function on the dataset, allowing for each average to to computed across all observations of a specific Subject performing a specific Task. See the project **ReadMe** for more information.
  * Thus, there are 180 observations total: 30 Subjects X 6 Activities.
  * All are numeric