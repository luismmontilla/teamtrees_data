#BiocManager::install(c("EBImage"))

library(dplyr)
library(ggplot2)
library(ggimage)

trees <- read.csv('data.csv') %>% 
  mutate(date = as.POSIXct(date))

images <- sample(c('icons/tree_1.svg', 'icons/tree_2.svg', 'icons/tree_3.svg',
            'icons/tree_4.svg', 'icons/tree_5.svg', 'icons/tree_6.svg',
            'icons/tree_7.svg', 'icons/tree_8.svg', 'icons/tree_9.svg'),
            size = nrow(trees),
            replace = TRUE)

p1 <- ggplot(trees, aes(x = date, y = trees)) +
  geom_image(aes(image = images)) +
  labs(x = 'Date', y = 'Number of trees') +
  theme_light()

ggsave('plot.svg', plot = p1)

