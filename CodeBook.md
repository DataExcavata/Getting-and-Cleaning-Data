## Getting and Cleaning Data - Course Project - tidy_mean.csv Codebook
========================================================

NOTE - The varialbes in this tidy data set have been renamed from their original source to be more descriptive.  For a 
more detailed explanation of the information that each source variable measured please reference the features_info.txt 
in the "UCI HAR Dataset" directory.

The variables for this are as follows:
                                        
    1   subject                                                    
    2   activity                                                   
    3   timeBodyAccelerometerMeanX                                 
    4   timeBodyAccelerometerMeanY                                 
    5   timeBodyAccelerometerMeanZ                                 
    6   timeBodyAccelerometerStandardDeviationX                    
    7   timeBodyAccelerometerStandardDeviationY                    
    8   timeBodyAccelerometerStandardDeviationZ                    
    9   timeGravityAccelerometerMeanX                              
    10  timeGravityAccelerometerMeanY                              
    11  timeGravityAccelerometerMeanZ                              
    12  timeGravityAccelerometerStandardDeviationX                 
    13  timeGravityAccelerometerStandardDeviationY                 
    14  timeGravityAccelerometerStandardDeviationZ                 
    15  timeBodyAccelerometerJerkMeanX                             
    16  timeBodyAccelerometerJerkMeanY                             
    17  timeBodyAccelerometerJerkMeanZ                             
    18  timeBodyAccelerometerJerkStandardDeviationX                
    19  timeBodyAccelerometerJerkStandardDeviationY                
    20  timeBodyAccelerometerJerkStandardDeviationZ                
    21  timeBodyGyroscopeMeanX                                     
    22  timeBodyGyroscopeMeanY                                     
    23  timeBodyGyroscopeMeanZ                                     
    24  timeBodyGyroscopeStandardDeviationX                        
    25  timeBodyGyroscopeStandardDeviationY                        
    26  timeBodyGyroscopeStandardDeviationZ                        
    27  timeBodyGyroscopeJerkMeanX                                 
    28  timeBodyGyroscopeJerkMeanY                                 
    29  timeBodyGyroscopeJerkMeanZ                                 
    30  timeBodyGyroscopeJerkStandardDeviationX                    
    31  timeBodyGyroscopeJerkStandardDeviationY                    
    32  timeBodyGyroscopeJerkStandardDeviationZ                    
    33  timeBodyAccelerometerMagnitudeMean                         
    34  timeBodyAccelerometerMagnitudeStandardDeviation            
    35  timeGravityAccelerometerMagnitudeMean                      
    36  timeGravityAccelerometerMagnitudeStandardDeviation         
    37  timeBodyAccelerometerJerkMagnitudeMean                     
    38  timeBodyAccelerometerJerkMagnitudeStandardDeviation        
    39  timeBodyGyroscopeMagnitudeMean                             
    40  timeBodyGyroscopeMagnitudeStandardDeviation                
    41  timeBodyGyroscopeJerkMagnitudeMean                         
    42  timeBodyGyroscopeJerkMagnitudeStandardDeviation            
    43  fourierBodyAccelerometerMeanX                              
    44  fourierBodyAccelerometerMeanY                              
    45  fourierBodyAccelerometerMeanZ                              
    46  fourierBodyAccelerometerStandardDeviationX                 
    47  fourierBodyAccelerometerStandardDeviationY                 
    48  fourierBodyAccelerometerStandardDeviationZ                 
    49  fourierBodyAccelerometerJerkMeanX                          
    50  fourierBodyAccelerometerJerkMeanY                          
    51  fourierBodyAccelerometerJerkMeanZ                          
    52  fourierBodyAccelerometerJerkStandardDeviationX             
    53  fourierBodyAccelerometerJerkStandardDeviationY             
    54  fourierBodyAccelerometerJerkStandardDeviationZ             
    55  fourierBodyGyroscopeMeanX                                  
    56  fourierBodyGyroscopeMeanY                                  
    57  fourierBodyGyroscopeMeanZ                                  
    58  fourierBodyGyroscopeStandardDeviationX                     
    59  fourierBodyGyroscopeStandardDeviationY                     
    60  fourierBodyGyroscopeStandardDeviationZ                     
    61  fourierBodyAccelerometerMagnitudeMean                      
    62  fourierBodyAccelerometerMagnitudeStandardDeviation         
    63  fourierBodyBodyAccelerometerJerkMagnitudeMean              
    64  fourierBodyBodyAccelerometerJerkMagnitudeStandardDeviation 
    65  fourierBodyBodyGyroscopeMagnitudeMean                      
    66  fourierBodyBodyGyroscopeMagnitudeStandardDeviation         
    67  fourierBodyBodyGyroscopeJerkMagnitudeMean                  
    68  fourierBodyBodyGyroscopeJerkMagnitudeStandardDeviation    

##Manipulations Applied
The source data files for this data set originally contained 10,299 observations of 561 variables for 6 activities performed by 30 different subjects.  The script analysis preformed on the source data made the following transformations:

    - Isolated 66 variables from the original 561 on the criteria of mean and standard deviation
    - Melted 10,299 observations of 66 variables into a skinny data set of 679,734 obs of "subject" and "activity"
    - Cast melted data into a data set of the mean value of the 66 variables aggregated on "subject" and "activity"

The result is a tidy data set containing 180 observations of 68 varaibles.  For the 30 distinct subjects, there is an
observation for each activity and the mean calclauted for each of the 66 variables isolated from the original 561.

