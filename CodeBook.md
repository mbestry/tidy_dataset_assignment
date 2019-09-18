Documents
mean_and_std.txt: table featuring means (excluding meanFreq) and standard deviations for each variable
means_table.txt: final table featuring mean results for each variable by subject and activity

Activity: Physical exercise activity type
Subject: Subject number (out of 30 subjects)
mean(): mean
std(): standard deviation

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

Steps:

1. Import data .txt files and name the datasets by their .txt file names
2. Annotate the test and train with subject and activity numbers
3. Merge the annotated test and train datasets into one larger dataset
4. Filter out mean and std columns, whilst excluding meanFreq columns
5. Label subject column
6. Replace activity numbers with activity names
7. Create means only dataset without meanFreq
8. Create table providing averages for each variable by subject and activity
9. Export mean and std table as a .txt file
10. Export table with averages for each variable by subject and activity as a .txt file
