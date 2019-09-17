X_test <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="")
y_test <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", quote="\"", comment.char="")
subject_test <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", quote="\"", comment.char="")
X_train <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/traimn/X_train.txt", quote="\"", comment.char="")
y_train <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_train.txt", quote="\"", comment.char="")
subject_train <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", quote="\"", comment.char="")
features <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt", quote="\"", comment.char="")
activity_labels <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt", quote="\"", comment.char="")

colnames(X_test) <- features$V2
colnames(X_train) <- features$V2
Test_dataset <- cbind(subject_test, y_test, X_test)
Train_dataset <- cbind(subject_train, y_train, X_train)
Merged_df <- rbind(Test_dataset, Train_dataset)

mean_std_colnames <- grep('-mean()|-std()',features$V2)
freqmean_colnames <- grep('-meanFreq()',features$V2)
mean_std_colnames <- mean_std_colnames[!(mean_std_colnames %in% freqmean_colnames)]
mean_std_colnames <- mean_std_colnames+2
mean_std_dataset <- Merged_df[,c(1,2,mean_std_colnames)]
colnames(mean_std_dataset)[1] <- c('Subject')
colnames(mean_std_dataset)[2] <- c('V1')
mean_std_dataset <- merge(activity_labels, mean_std_dataset, by.y = 'V1')
colnames(mean_std_dataset)[2] <- c('Activity')
mean_std_dataset <- mean_std_dataset[,c(-1)]

mean_colnames <- grep('-mean()',features$V2)
mean_colnames <- mean_colnames[!(mean_colnames %in% freqmean_colnames)]
mean_colnames <- mean_colnames+2
mean_dataset <- Merged_df[,c(1,2,mean_colnames)]
colnames(mean_dataset)[1] <- c('Subject')

mean_table <- mean_dataset %>% group_by(V1.1, Subject) %>% summarise_all('mean')
colnames(mean_table)[1] <- c('V1')
mean_table <- merge(activity_labels, mean_table, by.y = 'V1')
colnames(mean_table)[2] <- c('Activity')
mean_table <- mean_table[,c(-1)]

write.table(mean_table, file = "means_table.txt", row.names = FALSE)
