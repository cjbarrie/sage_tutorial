library(academictwitteR)
library(ggplot2)
library(dplyr)

#use https://tweeterid.com/ to convert your username to an ID
#or you can find user IDs in the collected tweets from before
#after using `bind_tweets()` with `output_format = "tidy"`
#where `author_id` is the user's tweeter ID

#get user @cbarrie
users <- "95226101"

#find who he's following
userfwing <- get_user_following(users)

#get their IDs if you wanted to further analysis on the following network of @cbarrie
ids <- userfwing$id

#get the user metrics of whom @cbarrie is following
userfwing_metrics <- userfwing$public_metrics

#plot 
userfwing_metrics %>%
  ggplot() +
  geom_histogram(aes(log(followers_count)),
                 binwidth = .5)

ggsave("images/userfwing_hist.png", 
       width=200, height = 150, 
       dpi=300, units="mm", bg = "white")

