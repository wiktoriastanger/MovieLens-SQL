# MovieLens-SQL
Practice project analyzing MovieLens 100k dataset with PostgreSQL

## Project Overview
This project is to explore **MovieLens 100k dataset** using SQL (PostgreSQL).  
The goal was to practice querying relational data and answer analytical questions about movies, users, and ratings.  
The dataset includes **100,000 ratings** from 943 users on 1,682 movies, with demographic information for users and genre flags for movies.

## Dataset
Source: [MovieLens 100k Dataset](https://grouplens.org/datasets/movielens/100k/)  
Tables used in this project:
- **movies** → movie metadata (title, release date, genre flags)  
- **ratings** → ratings given by users (user_id, movie_id, rating, timestamp)  
- **users** → demographic information (age, gender, occupation, zip code)  

## SQL Skills used
- Joins across multiple tables  
- Aggregations (`AVG`, `COUNT`, `ROUND`)  
- Filtering grouped results with `HAVING`  
- Conditional logic with `CASE`  
- Sorting and limiting results  
- Combining queries with `UNION`  

## Queries & Insights

### 1. Top 10 Best Rated Movies
- Finds movies with the highest average ratings (only titles with more than 50 ratings).  
- *Insight:* This prevents films with very few reviews from dominating the ranking, making results more reliable.

### 2. Top 10 Worst Rated Movies
- Finds the lowest-rated movies in the dataset.  
- *Insight:* Also Requiring at least 50 ratings makes the ranking more reliable.

### 3. Top 10 Most Frequently Rated Movies
- Identifies the most popular movies in terms of number of ratings.  
- *Insight:* These tend to be mainstream titles widely seen by users.

### 4. Average Rating by Genre
- Calculates the rating for each genre using genre flag columns.  
- *Insight:* Genres such as **Film-Noir** and **War** are rated higher, while **Horror** and **Fantasy** score lower.

### 5. Top 10 Most Active Users
- Finds the users who rated the most movies, along with their age, gender, and occupation.  
- *Insight:* The most active raters are a mix of students and working professionals (healthcare, education, engineering). Activity isn’t limited to the youngest group – older users (50–60) are also very engaged.

### 6. Movies with High Ratings (≥4.0) and at Least 50 Ratings
- Filters films that are both popular and well-received.  
- *Insight:* Ensures that high ratings are statistically significant (not just from a few of users).

### 7. Critical Age Groups
- Uses `CASE` to bucket users into age groups and compare average ratings.  
- *Insight:* The younger groups appears to be slightly more critical than older groups.

### 8. Underrated Movies
- Identifies films with a very high average rating (≥4.2) but very few ratings (≤25).  
- *Insight:* These are underrated and might be worth watching. 
