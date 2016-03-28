
Description
The script run_analysis.R was developed according to the instructions of the Data Cleaning Project as part of the course Data Science from John Hopkins University.

Variables
    - x_train, y_train, x_test, y_test, subject_train and subject_test are variables containing the data from downloaded files.
    - x_data, y_data and subject_data are merged data from the previous datasets.
    - f contains the correct names for the x_data dataset, which are applied to the column names stored in msf.
    - msf is a numeric vector used to extract the selected data.
    - act is a data frame used to extract activity names.
    - all_data merges the following variables x_data, y_data and subject_data in only one dataset.
    - avg_data contains the relevant averages which will be stored in the .txt file. 
    - ddply() from the plyr package is used to apply colMeans(). 

