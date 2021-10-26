library(academictwitteR)
library(ggplot2)
library(dplyr)
library(lubridate)

tweetsblm <- get_all_tweets(
  query = "BLM",
  start_tweets = "2020-01-01T00:00:00Z",
  end_tweets = "2020-01-05T00:00:00Z",
  bearer_token = get_bearer(),
  file = "data/blmtweets.rds",
  data_path = "data/json_data/",
  n = 500
)

tweetsblmb <- bind_tweets("data/json_data/", output_format = "tidy")
