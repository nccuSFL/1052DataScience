## Project - Predict Booking Rate using Expedia data(ICDM 2013)

### Project and Data Description

1. **Project description**

   1. Description

   2. Challenges
      * Data size
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

* Cross Validation
* AUC

### Data processing

1. Missing value
2. Categorical value to numeric value



### Features selection and features engineering

### Using classification model and result

1. Random Forest
2. Gradient Boost
3. SVM
4. Naive bayesian classifier

### Conclusion



REF:

https://github.com/shawnhero/ICDM2013-Expedia-Recommendation-System/tree/master/RScripts





