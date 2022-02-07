# Problem
The datasets contain the measures of the song features for roughly 41,000 songs from 1960 to 2019. The target column indicates if a song is a Hit or Flop. Hit songs are the ones that have been featured on the Billboard at least once. There is not a clear answer on which song features are most important in making a song a hit. To solve the problem, my team used R to build prediction models to find out what the most important song features are in modern hit songs. 

# Goal
The goal is to predict whether a song would be a hit or a flop by examining audio features of songs from 1960 to 2019. For example, if a music studio were to start a new project, would features like loudness, acousticness impact the song's popularity more than others?

# Key Metrics
-Prediction accuracy of the model <br />
-Variable importance<br />
-Prediction Accuracy with different dataset groups<br />

# Results
All of the models were created using R. 

## Exploratory Analysis: 
### Song Feature Changes From 1960-2019:
![Xnip2022-02-06_23-55-48](https://user-images.githubusercontent.com/33715191/152747512-dc2ca62c-3c0a-4d1c-8e92-56e5ddd473b5.jpg)

![Xnip2022-02-06_23-56-12](https://user-images.githubusercontent.com/33715191/152747518-983b67e3-9c62-4363-94fd-fa1b8a1f97a1.jpg) <br />

### Hit Song vs. Non-Hit Song Instrumentalness Comparison:
![Xnip2022-02-06_23-58-58](https://user-images.githubusercontent.com/33715191/152747865-d1087e68-cd9f-4f1c-b852-823c266c787b.jpg)

## Decision Tree:
![Xnip2022-02-07_00-00-17](https://user-images.githubusercontent.com/33715191/152748009-81a3061f-8695-429f-a54a-8e97bb2b23f5.jpg)<br />
We can wee that instrumentalness is the most important song feature deciding if a song would be a hit. 

### Logistic Regression:
### ROC Curve and Confusion Matrix (all decades)
![Xnip2022-02-07_00-03-32](https://user-images.githubusercontent.com/33715191/152748464-e98122d5-4af8-4c21-ac7f-16fb97036857.jpg)

### Roc Curve and Confusion Matrix (1990-2010s):
![Xnip2022-02-07_00-05-18](https://user-images.githubusercontent.com/33715191/152748788-c7a63a13-2eed-4a7f-b54b-84149d4cf15d.jpg)<br />
The result of logistic regression is similar to the results of classification tree.

## Random Forest:
### Out of bag Error by Number of Trees:
![Xnip2022-02-07_00-10-07](https://user-images.githubusercontent.com/33715191/152749191-b3fd430c-8b05-4d51-8f63-5b9c838fcfb8.jpg)

### Importance of Variables:
![Xnip2022-02-07_00-11-09](https://user-images.githubusercontent.com/33715191/152749316-9a06ddad-e047-4020-ac18-c7977b37ffad.jpg)

Random Forest has the highest accuracy out of all 3 predictive models that we used. 

## Conclusion:
### Modeling Conclusions: 
A song that has more vocals (less instrumentals), is more suitable for dancing (temp, rhythm, beat, regularity), and is less acoustic tends to produce a hit. From all three models we can conclude that instrumentalness has the highest hit song predictive power followed by danceability and acousticness. There is some variability throughout the decades. For example, acousticness was more important between 1960s to 1980s. And danceability and loudness have become more important in the past 30 years. We found that the accuracy was higher when we group the songs in 30-year groups. Random forest has the highest prediction accuracy of 84.29%, with classification trees at 79.26%, and classification with logistic regression at 79.65%.

### Additional Relevant Data Needed & Future Improvements:
While the insights we obtained are insightful, understanding what makes a song a hit based on only the audio features does not give us a big enough lens to accurately predict its popularity. Even if there were highly accurate guidelines for audio features that made a song popular, there are still additional relevant factors needed to actually produce a hit song. If an artist produces a song with predicted hit audio features, it is not guaranteed that song will become a hit. In reality, factors such as genre, monthly listeners, lyrics, number of albums produced, and number of previous hit songs, all play a deciding factorinthesuccessofasong. Forexample,analyzinglyrics,overallsentiment,amountofvocals,and synthetic sounds used could help the artists gain a better idea of the song’s composition. Another example would be if Adele releases a new song, it will most likely become a hit song solely because she has an already established fan base, has other top hit songs, and writes lyrics that resonate with her audience. Thus even if she produces a song with less popular audio features, say a song that is more instrumental and has less vocals, the song might still become a hit. Therefore, we need this type of data to be able to conclusively say what makes a song a hit.

However, even if we were able to gather all these features above, it would be quite hard to analyze. For example it would be hard to confidently say that only specific artists will produce a hit, there are more factors to consider.

During our research our team did try to obtain this additional information from other datasets, but when we combined it with our original data set, we lost a significant portion of our data. This was largely due to different data sets having different lists of hit songs or having multiple songs with the same song title. Thus, obtaining this specific data and ensuring all the different data sets have the same list of hit songs could be another limitation to this type of project.

# Reference For The Dataset
https://www.kaggle.com/theoverman/the-spotify-hit-predictor-dataset

https://github.com/fortytwo102/the-spotify-hit-predictor-dataset

