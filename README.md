# Getting_Cleanning_data project

## Goal:
The goal of this assignment is to generate a tidy data set from measured taking with a Samsung Galaxy S II which were realised to 30 subjects performing 6 different activities:  
    - WALKING 
    - WALKING_UPSTAIRS 
    - WALKING_DOWNSTAIRS 
    - SITTING
    - STANDING
    - LAYING

There are two datasets to be investigated which corresponds to two groups:
- Training data: 70 % of the volunteers 
- Test data: 30 % of the volunteers


## Datasets:
The data for this assignment can be downloaded from the following link:
[Data set for assignement](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

For this project, the files with the considered measuraments are:
- 'train/X_train.txt': Training set. The features are normalised and bounded within [-1,1].
- 'train/y_train.txt': Training labels with the activity performed
- 'test/X_test.txt': Same as before but for the test set.
- 'test/y_test.txt': Same as before but for the test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'test/subject_test.txt': Same as before but for the volunteers of the test data. 

The following additional files from the donwloaded folder are also used during the computation of the output tidy dataset:
- 'activity_labels.txt': Links the class labels (numbers) with their activity name.
- 'features.txt': List of all features.

Further information about these datasets can be found in:
[Human Activity Recognition Using Smartphones Data Set - UCI](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


## Files of this repository:
- 'README.md'
- 'CodeBook.md': describes the variables, the data, and work performed to clean up the datasets according to certain creteria.
- 'run_analysis.R': R programme which reads the *Samsung Galaxy S II* datasets, applies specific selection criterium, modifies certain variables, calculates some values and finally generates the output tidy dataset named *tidy_average_sub-act.txt*. Explanation of the different computational steps are explained within the document.  


## Procedure:
1. Download the *Data set for assignement* from the link above.

2. Unzip the document and move the folder to the working directory where the program *run_analysis.R* is. If another location is chosen for the downloaded folder (and datasets), specify the path when running the R program (step 3b). By default the path selected is: **path = "./UCI\ HAR\ Dataset/"**.

3. In R, run the progrramme as: 
    a. > source("run_analysis.R")
    b. > run_analysis() ; # include the correct path between the brackets if this is different from *path = "./UCI\ HAR\ Dataset/"*.

4. Then, the R programme generates a txt output file called *tidy_average_sub-act.txt* which contains the created tidy dataset.

5. As indicated at the beginng of the R programme, the output txt file can be read with the R command *read.table* using the option *header = TRUE* in order to assign a name to each of the columns of this dataset. These names are written in the first row of the fileout. 

