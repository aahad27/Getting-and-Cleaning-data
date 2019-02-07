# Reading the data and the lables and subjects

train_data<-read.table("./UCI HAR Dataset/train/X_train.txt") #train data
train_activity<-read.table("./UCI HAR Dataset/train/y_train.txt") #train actvity
train_subject<-read.table("./UCI HAR Dataset/train/subject_train.txt") #train subjects
test_data<-read.table("./UCI HAR Dataset/test/X_test.txt") #test data
test_activity<-read.table("./UCI HAR Dataset/test/y_test.txt") #test activity
test_subject<-read.table("./UCI HAR Dataset/test/subject_test.txt")


# reading features and activities

features<-read.table("./UCI HAR Dataset/features.txt")
activities<-read.table("./UCI HAR Dataset/activity_labels.txt")

# giving appropriate column names (question 4 of the assignment.)
names(train_data)<-features[,2]
names(train_activity)<-"activity"
names(train_subject)<-"subject"
names(test_data)<-features[,2]
names(test_activity)<-"activity"
names(test_subject)<-"subject"


# converting activitys to factor and giving appropriate levels 
# (question 3 of the assignment)
train_activity[,1]<-as.factor(train_activity[,1])
test_activity[,1]<-as.factor(test_activity[,1])
levels(train_activity[,1])<-activities[,2]
levels(test_activity[,1])<-activities[,2]

# merging first column wise the data activity and subject for train and test
# respectively and the row wise the entire train and test data sets
train_data<-cbind(train_subject,train_activity,train_data)
test_data<-cbind(test_subject,test_activity,test_data)
data<-rbind(train_data,test_data)

# taking only those variables that have mean and standard deviation
data<-data[,grep("mean|std|subject|activity",names(data))] #we include subject and activity too

# to summarize it into a independent tidy data set with the average of 
# each variable for each activity and each subject.

data<-tbl_df(data) #converting it to a data frame tibble
data<-group_by(data,subject,activity) # grouping the data by subject first then activity
final_data<-summarize_all(data,mean) # giving us the mean of all variables

