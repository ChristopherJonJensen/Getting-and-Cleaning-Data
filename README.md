# Getting and Cleaning Data: Course Project Readme
By: Chris Jensen

##Running my data analysis code (Assumptions and Requirements)
* As per the assignment description, my code assumes that the data files have been unzipped into R's working directory, maintaining the zip file's directory structure.
  * Source files can be downloaded from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* The script found in **run_analysis.R** outputs the tidy data into a file named **tidy.txt**.
* To review **tidy.txt**, it must be read in using the following code, in order to preserve the column names.

> read.table(file="tidy.txt", header = TRUE)

####Data Cleaning Process (Outline of **run_analysis.R**): 
1. In reading in **features.txt** and **activity_labels.txt**, I used the strip.white=TRUE argument to trim whitespace from both variables. This was necessary, because I was planning to use these values as column headers and a factor variable (respectively).
2. The names stored in "features.txt" were then used to assign column names to X_test and X_train.
  1. Due to some awkwardness in R's naming conventions, it was necessary to use the **make.names()** function on these column names prior to assigning them.
  2. Given that these column names are already descriptive (e.g., "fBodyAcc.meanFreq...Y"), and that they are defined in detail in the data's documentation, I felt it would be unnecessary (and possibly counterproductive) to try and modify them.
3. Since we were only looking for information pertaining to standard deviation and mean, I used **grep** to find all of the column names that included either *std* or *mean*. I then used the result of this search to subset the train_X and test_X data tables, reducing the overall number of columns to 79.
  1. *Note*: Given that we were not informed about the ultimate use to which our tidy datasets would be put, I decided to err on the side of caution in this step by being as inclusive as possible with regards to those columns that would be preserved.
4. Subject, Activity, and Observations tables were merged (for both the training and test sets). Then, the training and test sets were merged.
5. Since the first two columns lacked descriptive names, I labelled them "Subject" and "Task."
6. In order to make the data more readable, the numeric codes found in the "Task" column were converted into a factor variable (using the text from the **activity_labels.txt** file).
7. The table was then grouped by Subject and Task, and the average value of each measurement was computed across these groups (reducing the 10299 original observations to a more manageable 180).


## References and Acknowledgements:
In completing this assignment, **Community TA** David Hood's detailed and thoughtful forum posts were invaluable:
* David Hood, **David's personal course project FAQ**, https://class.coursera.org/getdata-013/forum/thread?thread_id=30
* David Hood, **Tidy data and the Assignment**, https://class.coursera.org/getdata-013/forum/thread?thread_id=31

Hadley Wickham's excellent paper on Tidy Data also provided numerous insights on the meaning, significance, and achievability of tidy data:
* Hadley Wickham, "Tidy Data," **Journal of Statistical Software**, (August 2014, Volume 59, Issue 10). Accessible online: http://www.jstatsoft.org/v59/i10/paper

This project is based on data collected by:
* Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. "Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine." **International Workshop of Ambient Assisted Living (IWAAL 2012)**. Vitoria-Gasteiz, Spain. Dec 2012. 
