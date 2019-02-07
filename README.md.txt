## For the script to work properly the R package dplyr must be isntalled and
## the UCI HAR dataset should be in your working directory.

# The working of the script

First we read the data of the test and train datasets.
We also read the activity labels and the subject labels.

We then read the features and the activity labels as a data table.
This will be useful for question 3 and 4 of the assignment.

Now to solve question 4 we use the second column of the features dataset, which 
is just all the features as provided to us in one column, to set it as the column
names for for the train and test data tables.

Now to solve question 3, we use the second column of the acticities data table.
we first convert the subject labels to a factor variabe. We then set the 
levels of the factor as the activity names.

Now we first merge the the train data table with its corresponding subjects and 
activities. We do the same with the test data table. We make use of cbind as the
"subject" and "activity" are two new variables.
We then merge the modified test and train data tables by using row bind as the 
variables are all the same its just two samples of the entire observation set.
We have thus solved question 1.

We then use the grep function to subset the variables that contain either "mean"
or "std". We also have to select the "subject" and "activity" variable.
Solving question 1.

Now for the final Question 5.
We first convert the table to a data frame tibble. We then use the group_by 
fucntion to group the merged data set on the basis of subject first and then 
activities. We then use the summarise_all function to summarise all the non 
grouped variables by their mean.
We thus get  tall and narrow tidy data set containing the mean of all terms
that relate to mean or standard deviation for eact subject and each activty.

## The output i.e the final tidy data is saved in a data table named
## final_data

Thanking you,
Aahad Mundrawala.