import pandas as pd
from sqlalchemy import create_engine
import pyodbc
import nltk
from nltk.sentiment.vader import SentimentIntensityAnalyzer

# download the VADER lexicon for sentiment analysis if not already present
# nltk.download('vader_lexicon')
'''
def fetch_data_from_sql():
    # Define the connection string with parameters for the database connection
     # SQLAlchemy connection string for SQL Server with Windows Authentication
    conn_str = (
        "mssql+pyodbc://MOHANA-LAPTOP\SQLEXPRESS/PortfolioProject_MarketingAnalytics" 
        "?driver=SQL+Server"
        "&trusted_connection=yes"
    )

    engine = create_engine(conn_str)

    query = "SELECT ReviewID, CustomerID, ProductID, ReviewDate, Rating, ReviewText FROM fact_customer_reviews"

    df = pd.read_sql_query(query, engine)

    # return the fetched DataFrame
    return df

# fetch the customer reviews data from the SQL database
customer_reviews_df = fetch_data_from_sql()
'''
def fetch_data_from_sql():
    try:
        conn_str = (
            "mssql+pyodbc://localhost\\SQLEXPRESS/PortfolioProject_MarketingAnalytics"
            "?driver=ODBC+Driver+17+for+SQL+Server"
            "&trusted_connection=yes"
        )
        engine = create_engine(conn_str)
        query = "select ReviewID, CustomerID, ProductID, ReviewDate, Rating, ReviewText from dbo.customer_reviews;"
        df = pd.read_sql(query, engine)
        print("Data successfully fetched. Shape:", df.shape)
        return df
    except Exception as e:
        print("Error in fetch_data_from_sql:", e)
        return None

customer_reviews_df = fetch_data_from_sql()
if customer_reviews_df is None:
    print("Failed to fetch data. Stopping script.")
    exit()
else:
    print(customer_reviews_df.head())

# initialize the VADER sentiment intensity analyzer for analysing the sentiment of text data
sia = SentimentIntensityAnalyzer()

# Define a function to calculate sentiment scores for each review using VADER
def calculate_sentiment(review):
    # get the sentiment scores for the review text
    sentiment = sia.polarity_scores(review)
    # return compound score, which is most positive +ve or most negetive -ve
    return sentiment['compound']

# Define a function to categorize sentiment using both the sentiment score and the review rating
def categorize_sentiment(score, rating):
    
    if score > 0.05: # +ve sentiment score
        if rating >= 4:
            return 'Positive'
        elif rating == 3:
            return 'Mixed Positive'
        else:
            return 'Mixed Negetive'
    elif score < -0.05: # -ve sentiment score
        if rating <= 2:
            return 'Negetive'
        elif rating == 3:
            return 'Mixed Negetive'
        else:
            return 'Mixed Positive'
    else:
        if rating >= 4:
            return 'Positive'
        elif rating <= 2:
            return 'Negetive'
        else:
            return 'Neutral'

# Define a function to bucket sentiment scores for each review
def sentiment_bucket(score):
    if score >= 0.5:
        return '0.5 to 1.0' # Strongly positive sentiment
    elif 0.0 < score <= 0.5:
        return '0.0 to 0.5' # Mildly positive sentiment
    elif -0.5 <= score < 0.0:
        return '-0.49 to 0.0' # Mildly negetive sentiment
    else:
        return '-1.0 to -0.5' # Strongly negetive sentiment


# Apply sentiment analysis to calculate sentiment scores for each review
customer_reviews_df['SentimentScore'] = customer_reviews_df['ReviewText'].apply(calculate_sentiment)

# Apply sentiment categorization using both text and rating
customer_reviews_df['SentimentCategory'] = customer_reviews_df.apply(
    lambda row: categorize_sentiment(row['SentimentScore'], row['Rating']), axis=1)

# Apply sentiment bucketing to categorize scores into defined ranges
customer_reviews_df['SentimentBucket'] = customer_reviews_df['SentimentScore'].apply(sentiment_bucket)

# Display the first few rows of the DataFrame with sentiment scores, categories, and buckets
print(customer_reviews_df.head())

# Save the DataFrame with sentiment scores, categories, and buckets to a new CSV file
customer_reviews_df.to_csv('fact_customer_reviews_with_sentiment.csv', index=False)