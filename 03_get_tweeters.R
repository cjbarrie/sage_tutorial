library(academictwitteR)
library(ggplot2)
library(dplyr)

#use https://tweeterid.com/ to convert your username to an ID
#or you can find user IDs in the collected tweets from before
#after using `bind_tweets()` with `output_format = "tidy"`
#where `author_id` is the user's tweeter ID

users <- "95226101"
userfwing <- get_user_following(users)

ids <- userfwers$id

userfwers_metrics <- userfwers$public_metrics

userfwers_metrics %>%
  ggplot() +
  geom_histogram(aes(log(followers_count)),
                 binwidth = .5)
