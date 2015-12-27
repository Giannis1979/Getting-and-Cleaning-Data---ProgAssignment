# Getting-and-Cleaning-Data---ProgAssignment
run_analysis.R script collects data by reading files from the UCI HAR Dataset saved in the working directory with the aim to produce a clean/tidy dataset.
the script reads the activity labels and features. Features are renamed to remove abbreviations. Train and test data set are read and combined with the column names included. Only means and standard deviations are kept in the dataset for all activities and subject groups. The data is then grouped by subject (1-30) and activity (1-6) and the mean is computed using the dplyr package. The final tidy dataset is then saved in the working directory as "tidy_average_by_activity_and_subject.txt"
the output shows the average standard deviations and means for each activity (Laying, Sitting, Standing, Walking, Walking Downstairs, walking upstairs) for the 30 different subject groups. A small subset of the script output is displayed below.

activity_lable	subject	TimeBodyAcceleration-mean()-X   ..............................................
LAYING	1	0.221598244
SITTING	1	0.261237565
STANDING	1	0.278917629
WALKING	1	0.277330759
WALKING_DOWNSTAIRS	1	0.28918832
WALKING_UPSTAIRS	1	0.25546169
.
.
.
.
.
.
.




