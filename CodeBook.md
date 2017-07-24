Code Book

This code book provides more details about the data set used for this study as well as some details about the variables included 
in the tidy data set created after running run_analysis.R

run_analysis.R can be run after changing the working directory in line 6 from my own to another of the user's choice, assuming it is
the directory above "UCI HAR Dataset" which contains all of the relevant files. The script unzips the files, reads in labels from:
activity_labels.txt
features.txt

It then reads in the training and test sets:
subject_test.txt and subject_train.txt which are columns of numbers identifing the test subjects,
X_test.txt and X_train.txt which contain the data,
y_test.txt and y_train.txt which are columns of numbers identifying which of the six activity types the rows correspond to.
The activity types are walking, walking upstairs, walking downstairs, sitting, standing, and laying.

It then assigns column names to the data and merges the training and test sets into one full set. The columns corresponding to the mean 
and standard deviations of the variables are saved into another data set and appropriately labeled. Finally, a tidy set with the 
average of each variable for each activity and each subject is created and is included in this repository. The variables included in the
tidy set are listed below. They correspond to triaxial acceleration from an accelerometer (total acceleration) and the estimated body 
acceleration, triaxial Angular velocity from the gyroscope, and a feature vector with time and frequency domain variables. 

"SubjectLabel"                                    
"ActivityLabel"                                   
"timeBodyAccelerometer-Mean-X"                    
"timeBodyAccelerometer-Mean-Y"                    
"timeBodyAccelerometer-Mean-Z"                    
"timeBodyAccelerometer-Std-X"                     
"timeBodyAccelerometer-Std-Y"                     
"timeBodyAccelerometer-Std-Z"                     
"timeGravityAccelerometer-Mean-X"                 
"timeGravityAccelerometer-Mean-Y"                 
"timeGravityAccelerometer-Mean-Z"                 
"timeGravityAccelerometer-Std-X"                  
"timeGravityAccelerometer-Std-Y"                  
"timeGravityAccelerometer-Std-Z"                  
"timeBodyAccelerometerJerk-Mean-X"                
"timeBodyAccelerometerJerk-Mean-Y"                
"timeBodyAccelerometerJerk-Mean-Z"                
"timeBodyAccelerometerJerk-Std-X"                 
"timeBodyAccelerometerJerk-Std-Y"                 
"timeBodyAccelerometerJerk-Std-Z"                 
"timeBodyGyroscope-Mean-X"                        
"timeBodyGyroscope-Mean-Y"                        
"timeBodyGyroscope-Mean-Z"                        
"timeBodyGyroscope-Std-X"                         
"timeBodyGyroscope-Std-Y"                         
"timeBodyGyroscope-Std-Z"                         
"timeBodyGyroscopeJerk-Mean-X"                    
"timeBodyGyroscopeJerk-Mean-Y"                    
"timeBodyGyroscopeJerk-Mean-Z"                    
"timeBodyGyroscopeJerk-Std-X"                     
"timeBodyGyroscopeJerk-Std-Y"                     
"timeBodyGyroscopeJerk-Std-Z"                     
"timeBodyAccelerometerMagnitude-Mean"             
"timeBodyAccelerometerMagnitude-Std"              
"timeGravityAccelerometerMagnitude-Mean"          
"timeGravityAccelerometerMagnitude-Std"           
"timeBodyAccelerometerJerkMagnitude-Mean"         
"timeBodyAccelerometerJerkMagnitude-Std"          
"timeBodyGyroscopeMagnitude-Mean"                 
"timeBodyGyroscopeMagnitude-Std"                  
"timeBodyGyroscopeJerkMagnitude-Mean"             
"timeBodyGyroscopeJerkMagnitude-Std"              
"frequencyBodyAccelerometer-Mean-X"               
"frequencyBodyAccelerometer-Mean-Y"               
"frequencyBodyAccelerometer-Mean-Z"               
"frequencyBodyAccelerometer-Std-X"                
"frequencyBodyAccelerometer-Std-Y"                
"frequencyBodyAccelerometer-Std-Z"                
"frequencyBodyAccelerometer-Meaneq()-X"           
"frequencyBodyAccelerometer-Meaneq()-Y"           
"frequencyBodyAccelerometer-Meaneq()-Z"           
"frequencyBodyAccelerometerJerk-Mean-X"           
"frequencyBodyAccelerometerJerk-Mean-Y"           
"frequencyBodyAccelerometerJerk-Mean-Z"           
"frequencyBodyAccelerometerJerk-Std-X"            
"frequencyBodyAccelerometerJerk-Std-Y"            
"frequencyBodyAccelerometerJerk-Std-Z"            
"frequencyBodyAccelerometerJerk-Meaneq()-X"       
"frequencyBodyAccelerometerJerk-Meaneq()-Y"       
"frequencyBodyAccelerometerJerk-Meaneq()-Z"       
"frequencyBodyGyroscope-Mean-X"                   
"frequencyBodyGyroscope-Mean-Y"                   
"frequencyBodyGyroscope-Mean-Z"                   
"frequencyBodyGyroscope-Std-X"                    
"frequencyBodyGyroscope-Std-Y"                    
"frequencyBodyGyroscope-Std-Z"                    
"frequencyBodyGyroscope-Meaneq()-X"               
"frequencyBodyGyroscope-Meaneq()-Y"               
"frequencyBodyGyroscope-Meaneq()-Z"               
"frequencyBodyAccelerometerMagnitude-Mean"        
"frequencyBodyAccelerometerMagnitude-Std"         
"frequencyBodyAccelerometerMagnitude-Meaneq()"    
"frequencyBodyAccelerometerJerkMagnitude-Mean"    
"frequencyBodyAccelerometerJerkMagnitude-Std"     
"frequencyBodyAccelerometerJerkMagnitude-Meaneq()"
"frequencyBodyGyroscopeMagnitude-Mean"            
"frequencyBodyGyroscopeMagnitude-Std"             
"frequencyBodyGyroscopeMagnitude-Meaneq()"        
"frequencyBodyGyroscopeJerkMagnitude-Mean"        
"frequencyBodyGyroscopeJerkMagnitude-Std"         
"frequencyBodyGyroscopeJerkMagnitude-Meaneq()"
