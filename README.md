# Getting-and-Cleaning-Data---ProgAssignment
run_analysis.R script collects data by reading files from th UCI HAR Dataset saved in the working dirrectory with the aim to produce a clean/tidy dataset.

the script reads the activity lables and features. feratures are renamed to remove abriviations. Train and test data set are read and combined with the column names inclueded.
only means and standard deviations are kept in the dataset for all activities and subject groups. The data is then grouped by subject (1-30) and activity (1-6) and the mean is computed using teh dplyr package.
The final tidy dataset is then saved in the working directory as "tidy_average_by_activity_and_subject.txt"

