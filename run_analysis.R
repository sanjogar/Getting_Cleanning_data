#-------------------------------------------------------------------------------
# GOAL: prepare a tidy data from a series of data sets which is then written in
# a txt file called: fileout = "tidy_average_sub-act.txt"
#
# Folder with the data sets can be downloaded from:
# url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#
# After downloading and unziping the file, indicate the path where the folder
# is located when calling the function by modifiying the input variable "path".
#
### ADVICE::
## When reading the outfput file with the R command "read.table", use 
# "header = TRUE" to include the name of the columns (indicated in the 
# first row of this output file). Example:
#
# averagedf <- read.table(fileout, header = TRUE)
#-------------------------------------------------------------------------------

run_analysis <- function(path = "./UCI\ HAR\ Dataset/"){
    
    ####-----------------------------------------
    # 0. Libraries used for this assignment:
    library(plyr)
    library(dplyr)
    
    
    ####-----------------------------------------
    ## 1. Merge the training and the test sets to create one data set:
    
    type <- c("test", "train")
    nele <- length(type)
    fileX <- character(nele)
    fileY <- character(nele)
    fileSub <- character(nele)
    
    for (i in 1:2) {
        fileX[i] <- paste(path, type[i], "/X_", type[i], ".txt", sep="")
        fileY[i] <- paste(path, type[i], "/y_", type[i], ".txt", sep="")
        fileSub[i] <- paste(path, type[i], "/subject_", type[i], ".txt", sep="")
    }
    
    # Reading all files:
    # Documents with general information about variables: 
    fea <- paste(path, "features.txt", sep="")
    dffea <- read.table(fea)
    act <- paste(path, "activity_labels.txt", sep="")
    dfact <- read.table(act)
    
    # Test folder:
    dftestX <- read.table(fileX[1], col.names=dffea$V2)
    dftestY <- read.table(fileY[1], col.names = "activity")
    dftestsub <- read.table(fileSub[1], col.names = "subject")
    
    # Train folder:
    dftrainX <- read.table(fileX[2], col.names=dffea$V2)
    dftrainY <- read.table(fileY[2], col.names = "activity")
    dftrainsub <- read.table(fileSub[2], col.names = "subject")
    
    # Adding the subject to each of these data sets:
    dftestX$subject <- dftestsub$subject
    dftrainX$subject <- dftrainsub$subject
    # Adding the activity to each of these data sets:
    dftestX$activity <- dftestY$activity
    dftrainX$activity <- dftrainY$activity
    
    # Merging both the test and train sets of data:
    mergedf = merge(dftrainX, dftestX, all=TRUE)
    
    
    ####-----------------------------------------
    ## 2.Extract only the measurements on the mean and standard deviation.
    
    meanstd_df <- select(mergedf, subject, activity, contains(".mean"), contains(".std"))
    
    
    ####-----------------------------------------
    ## 3. Use descriptive activity names to name the activities in the data set. 
    
    for (i in 1:nrow(dfact)) {
        meanstd_df$activity[meanstd_df$activity == dfact$V1[i]] <- as.character(dfact$V2[i])
    }
    
    
    ####-----------------------------------------
    ## 4. Label more appropiately the data set with descriptive variable names. 
    #
    # DONE in step 1 but redifined here: 
    
    meanstd_col <- colnames(meanstd_df)
    namescol <- sub("..", "", meanstd_col, fixed = TRUE)
    
    colnames(meanstd_df) <- namescol
    
    
    ####-----------------------------------------
    ## 5. Create independent tidy data set with the average of each variable
    # for each activity and each subject.
    
    SubAct <- meanstd_df %>% group_by(subject, activity) 
    average_df <- SubAct %>% summarize_each(funs(mean(., na.rm = TRUE)))
    
    # Writting the tidy data set in a new txt file:
    fileout = "tidy_average_sub-act.txt"
    write.table(average_df, file = fileout, row.names = FALSE, col.names = namescol)

} 



