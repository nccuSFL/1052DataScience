## Project - Predict Booking using Expedia data(ICDM 2013)

### Project and Data Description

1. **Project description**

   1. Description

   2. Challenges
      * Data size
        * downsampling
      * Complex data
      * Missing value
      * Mixure of random/non-random

   ​

2. **Data description: 54 features into 6 Categories**

   1. Search Criteria
      * Date and time of search
      * Destination id
      * Length of stay
      * Number of rooms, adults, childs
      * Including Saturday or not. 
   2. Hotel characteristics (static)
      * Hotel id
      * Hotel country
      * Star rating
      * User review score
      * Major hotel chain or independent
      * Hotel historical price
      * Desirability of hotel (0-5)
   3. Hotel characteristics (dynamic)
      * Expedia rank position
      * Price
      * Promotion flag
      * If clicked, if booked
      * Booking value
   4. Visitor information
      * Vistor country, distance between hotel
      * Vistor mean star rate, mean price per night
   5. Competitive OTA information
      * Expedia price compare to competitor
      * Competitor availability
      * Price different
   6. Other
      * Search id
      * point of sale(expedia.fr, .com...)
      * If random sorted

3. Basic data overview and correlation analysis

   * group booking or not
     * 4.5% clicking, 2.78% booking
   * position <-> booking
   * hotel price, rating, star, location

   ​

### Evaluation

* Split data to **Train**(75%), **Cross Validation(5 fold)** and **Test**(25%) data set
* ROC, ***AUC***
* Sensitivity, Specificity

### Data processing

1. Missing value

   * hotel descriptions:***prop_review_score***, ***prop_location_score2***, ***srch_query_affinity_score***
     * use worse case
   * Historical data:
     * use mean value
   * Competitor information:
     * set as 0
       * No significan difference

2. Features normalization

   * log Price features: ***price_usd***, ***visitor_hist_adr_usd***

3. Down sampling negative instances

   * Choose balanced positive and negative data

4. Randomly sample 10% by srch_id

   ​



### Features selection and features engineering

### Using classification model and result

1. Null model
   * fill with all 0(or all 1): AUC = 0.5	
2. Random Forest
3. Logistic Regression
4. Gradient Boost
5. SVM

### Conclusion



Reference:

* ICDM 2013: https://github.com/shawnhero/ICDM2013-Expedia-Recommendation-System/tree/master/RScripts


* random forest: http://dni-institute.in/blogs/random-forest-using-r-step-by-step-tutorial/


* use caret to do cv: http://machinelearningmastery.com/how-to-estimate-model-accuracy-in-r-using-the-caret-package/
* binary outcome modeling: http://amunategui.github.io/binary-outcome-modeling/
* SVM:https://www.r-bloggers.com/the-5th-tribe-support-vector-machines-and-caret/
* LR:https://www.r-bloggers.com/evaluating-logistic-regression-models/
* deal with imbalance data: https://www.analyticsvidhya.com/blog/2016/03/practical-guide-deal-imbalanced-classification-problems/





d -> data visualization

 -> data_processing -> train, test -> downSampling