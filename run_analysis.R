
library(plyr)

# -----------------------------------------------------------------
# 1. Merges the training and the test sets to create one data set.
# -----------------------------------------------------------------

subject_train <- read.table("train/subject_train.txt")
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")

subject_test <- read.table("test/subject_test.txt")
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")

#
# merging 'subject' data set
#
subject_data <- rbind(subject_train, subject_test)

#
# merging 'x' data set
#
x_data <- rbind(x_train, x_test)

#
# merging 'y' data set
#
y_data <- rbind(y_train, y_test)


# -----------------------------------------------------------------
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# -----------------------------------------------------------------
f <- read.table("features.txt")

#
# extracting only columns with mean() or std()
#
msf <- grep("-(mean|std)\\(\\)", f[, 2])

#
# subset the selected columns
#
x_data <- x_data[, msf]

#
# correcting the column names
#
names(x_data) <- f[msf, 2]

# -----------------------------------------------------------------
# 3. Uses descriptive activity names to name the activities in the data set
# -----------------------------------------------------------------

act <- read.table("activity_labels.txt")

#
# updating values using the correct activity names
#
y_data[, 1] <- act[y_data[, 1], 2]

#
# correcting the column name
#
names(y_data) <- "activity"

# -----------------------------------------------------------------
# 4. Appropriately labels the data set with descriptive variable names.
# -----------------------------------------------------------------

#
# correcting column name
#
names(subject_data) <- "subject"

#
# merging all the data in one data set
#
all_data <- cbind(x_data, y_data, subject_data)

# -----------------------------------------------------------------
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# -----------------------------------------------------------------

avg_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(avg_data, "averages_data.txt", row.name=FALSE)
