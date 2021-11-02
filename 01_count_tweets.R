library(academictwitteR)
library(ggplot2)
library(dplyr)
library(lubridate)

tweetcounts <- count_all_tweets(
  query = "Hogmanay",
  start_tweets = "2019-12-27T00:00:00Z",
  end_tweets = "2020-01-05T00:00:00Z",
  bearer_token = get_bearer(),
  granularity = "hour",
  n = 500
)

#reformat date
tweetcounts$time <-
  parse_date_time(tweetcounts$start, orders = "ymd hms")

#plot 
tweetcounts %>% ggplot() +
  geom_line(aes(time, tweet_count))

ggsave("images/hogmanay.png", 
       width=200, height = 150, 
       dpi=300, units="mm", bg = "white")

saveRDS(tweetcounts, "data/tweetcounts_hogmanay.rds")
