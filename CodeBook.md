### Information with the name of the variables, the data and the transformations performed to clean up the downloaded datasets. 

#### The following points describe the different steps followed by the R programme "run_analysis.R". The goal is to generate a tidy data set from original measuraments according to certain parameters and criteria:

0. In the argument of the program it is specified the path where the downloaded folder with the original data sets is located. It indicates the library used.

1. The R program reads separately the measures from the train and test sets as well as the corresponding activity labels and subjects, which are added a posterioro. See *README.md* file for the name of the specific datasets used at this stage. 
The variable of the feature vector for each patern are further describe in the donwloaded file "features_info.txt", as well as the other derived variables estimated by several mathematical calculations such as: mean, standard deviation, median, min, max, etc. 
Then, the programme merges these two data sets (test and train), such as the number of columns are the same (since the studied variables are the same for both data sets, as well as their names), and so only the number of rows increase. The output data frame has a dimension of 10299 x 563 (which includes the 561-feature vector and the columns with the subject and activity information). 

2. It extracts only the columns corresponding to those variables for which the mean and standard deviation were calculated. The column names of these variable contained the keywords: **mean** and **std**. The dimension of this reduced data frame is the 10299 x 81
The name of the selected variables are listed at the end of this document. These variables are dimensionless because all measuraments were normalised in the downloaded files. 

3. The activities recorded, which were identified with numbers ranging from 1 to 6, are then renamed with the same descriptive labels as presented in the downloaded file "activity_labels.txt". Therefore, the class of this variable is changed from *integer* to *character*. 

4. The name of the columns are slighly modified by removing the specific character ".." generated when reading the datasets and using the *col.names*. 

5. Calculates the average of each of the selected variables in point number 2 (listed below) for each subject and for each activity. For this, the data frame in step 4 is grouped simultaneously into the two columns *subject* and *activity*. Then, the function **summarize_each** is used to calculate the average (mean) for all remaining columns which have not beeing used in the grouping criterium. This implies that for each subject and each activity, the mean of all variables listed at the end of this document are calculated and stored in a new data frame variable. Its dimension is 180 x 81 (the specific number of rows comes from the 6 activities x 30 subjects = 180). Therefore, this step creates an independent tidy data set which is finally saved in an output file called "tidy_average_sub-act.txt". The names of the columns are included when writing the file (not the row names). However, to properly read the column names, the argument *header = TRUE* in the *read.table* command should be added.  



#### Name of the variables selected in step 2:
[3] "tBodyAcc.mean...X"              
[4] "tBodyAcc.mean...Y"              
[5] "tBodyAcc.mean...Z"              
[6] "tGravityAcc.mean...X"           
[7] "tGravityAcc.mean...Y"           
[8] "tGravityAcc.mean...Z"           
[9] "tBodyAccJerk.mean...X"          
[10] "tBodyAccJerk.mean...Y"          
[11] "tBodyAccJerk.mean...Z"          
[12] "tBodyGyro.mean...X"             
[13] "tBodyGyro.mean...Y"             
[14] "tBodyGyro.mean...Z"             
[15] "tBodyGyroJerk.mean...X"         
[16] "tBodyGyroJerk.mean...Y"         
[17] "tBodyGyroJerk.mean...Z"         
[18] "tBodyAccMag.mean.."             
[19] "tGravityAccMag.mean.."          
[20] "tBodyAccJerkMag.mean.."         
[21] "tBodyGyroMag.mean.."            
[22] "tBodyGyroJerkMag.mean.."        
[23] "fBodyAcc.mean...X"              
[24] "fBodyAcc.mean...Y"              
[25] "fBodyAcc.mean...Z"              
[26] "fBodyAcc.meanFreq...X"          
[27] "fBodyAcc.meanFreq...Y"          
[28] "fBodyAcc.meanFreq...Z"          
[29] "fBodyAccJerk.mean...X"          
[30] "fBodyAccJerk.mean...Y"          
[31] "fBodyAccJerk.mean...Z"          
[32] "fBodyAccJerk.meanFreq...X"      
[33] "fBodyAccJerk.meanFreq...Y"      
[34] "fBodyAccJerk.meanFreq...Z"      
[35] "fBodyGyro.mean...X"             
[36] "fBodyGyro.mean...Y"             
[37] "fBodyGyro.mean...Z"             
[38] "fBodyGyro.meanFreq...X"         
[39] "fBodyGyro.meanFreq...Y"         
[40] "fBodyGyro.meanFreq...Z"         
[41] "fBodyAccMag.mean.."             
[42] "fBodyAccMag.meanFreq.."         
[43] "fBodyBodyAccJerkMag.mean.."     
[44] "fBodyBodyAccJerkMag.meanFreq.." 
[45] "fBodyBodyGyroMag.mean.."        
[46] "fBodyBodyGyroMag.meanFreq.."    
[47] "fBodyBodyGyroJerkMag.mean.."    
[48] "fBodyBodyGyroJerkMag.meanFreq.."
[49] "tBodyAcc.std...X"               
[50] "tBodyAcc.std...Y"               
[51] "tBodyAcc.std...Z"               
[52] "tGravityAcc.std...X"            
[53] "tGravityAcc.std...Y"            
[54] "tGravityAcc.std...Z"            
[55] "tBodyAccJerk.std...X"           
[56] "tBodyAccJerk.std...Y"           
[57] "tBodyAccJerk.std...Z"           
[58] "tBodyGyro.std...X"              
[59] "tBodyGyro.std...Y"              
[60] "tBodyGyro.std...Z"              
[61] "tBodyGyroJerk.std...X"          
[62] "tBodyGyroJerk.std...Y"          
[63] "tBodyGyroJerk.std...Z"          
[64] "tBodyAccMag.std.."              
[65] "tGravityAccMag.std.."           
[66] "tBodyAccJerkMag.std.."          
[67] "tBodyGyroMag.std.."             
[68] "tBodyGyroJerkMag.std.."         
[69] "fBodyAcc.std...X"               
[70] "fBodyAcc.std...Y"               
[71] "fBodyAcc.std...Z"               
[72] "fBodyAccJerk.std...X"           
[73] "fBodyAccJerk.std...Y"           
[74] "fBodyAccJerk.std...Z"           
[75] "fBodyGyro.std...X"              
[76] "fBodyGyro.std...Y"              
[77] "fBodyGyro.std...Z"              
[78] "fBodyAccMag.std.."              
[79] "fBodyBodyAccJerkMag.std.."      
[80] "fBodyBodyGyroMag.std.."         
[81] "fBodyBodyGyroJerkMag.std.." 
