# Getting and Cleaning Data: Course Project Readme
By: Chris Jensen

*Note:* This readme only contains directions for executing my *data_analysis.R* script. For information about the manipulations performed upon the data, as well as the specific variables found in the tidy data set, please consult my Code Book for this project (also found in the present repo).

##Running my data analysis code (Assumptions and Requirements)
* As per the assignment description, my code assumes that the data files have been unzipped into R's working directory, maintaining the zip file's directory structure.
  * Source files can be downloaded from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* The script found in **run_analysis.R** outputs the tidy data into a file named **tidy.txt**.
  * For an overview of the decisions I made in tidying the data, please consult the Code Book.
* To review **tidy.txt**, it must be read in using the following code, in order to preserve the column names.

> read.table(file="tidy.txt", header = TRUE)

## References and Acknowledgements:
In completing this assignment, **Community TA** David Hood's detailed and thoughtful forum posts were invaluable:
* David Hood, **David's personal course project FAQ**, https://class.coursera.org/getdata-013/forum/thread?thread_id=30
* David Hood, **Tidy data and the Assignment**, https://class.coursera.org/getdata-013/forum/thread?thread_id=31

Hadley Wickham's excellent paper on Tidy Data also provided numerous insights on the meaning, significance, and achievability of tidy data:
* Hadley Wickham, "Tidy Data," **Journal of Statistical Software**, (August 2014, Volume 59, Issue 10). Accessible online: http://www.jstatsoft.org/v59/i10/paper

This project is based on data collected by:
* Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. "Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine." **International Workshop of Ambient Assisted Living (IWAAL 2012)**. Vitoria-Gasteiz, Spain. Dec 2012. 
