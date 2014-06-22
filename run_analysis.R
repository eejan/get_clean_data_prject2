

# read data
trnx = read.table("train/X_train.txt");
tstx = read.table("test/X_test.txt");
trny = read.table("train/y_train.txt");
tsty = read.table("test/y_test.txt");

#combine traning and testing data
x = rbind(trnx,tstx);
y = rbind(trny,tsty);


#name activity (Y)
actname = read.table("./activity_labels.txt")  # need to apply y as factor
yfc = factor(y$V1,labels=actname[,2])  
y$act = factor(y$V1,labels=actname[,2])  

# name label variable name
featureName = read.table("features.txt")
colnames(x) = featureName[,2]

# extract mean and std measurement
x.mean = x[,grep("mean", colnames(x))]  
x.std = x[,grep("std", colnames(x))]
x.meanstd = cbind(x.mean,x.std)

# get subjects
subtst = read.table("test/subject_test.txt")
subtrn = read.table("train/subject_train.txt")
subject = rbind(subtrn,subtst)

# mean.featname = paste(rep("subj_mean", 561),featureName[,2], sep="_")
# add subj_mean prefix to variable name
subj_mean_featname = paste(rep("subj_mean",length(names(x.meanstd))), names(x.meanstd), sep="_")
colnames(x.meanstd) = subj_mean_featname

#colnames(x) = mean.featname
# create new data frame
ans = cbind(subject, y[,2], x.meanstd)
colnames(ans)[2] = "activity"
colnames(ans)[1] = "Subject"

#calcuate mean of the measurement for each avitivity and subject
tidy.mean = aggregate(. ~Subject+activity, data=ans, mean)
# output file results
write.csv(tidy.mean,"sub_mean_feature.csv", row.names=F)

