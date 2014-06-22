get_clean_data_prject2
======================

term project 

1. extract data to a local directory. 
2. install the R.code at "UCT HAR Dataset directory"
3. run run_analysis.R
4. it will create output file call: sub_mean_feature.csv


detail:
1. load train data from train/X_train.txt train/y_train.txt 
   and test/X_test.txt, test/y_test.ext

2. combine train and test using rbind

3. load active name. make it as factor  ./activity_labels.txt

4. add colname for x

5. extract mean and std meansurement
   also change the colname by add a prefix of "subj_mean"

6. get subject 

7. combine subject, avtive and  measurement of mean and std

8. calcualte mean of data

9. write out as csv
