#BiocManager::install(c("EBImage"))

library(ggplot2)
library(ggimage)

images <- c('icons/tree_1.svg', 'icons/tree_2.svg', 'icons/tree_3.svg',
            'icons/tree_4.svg', 'icons/tree_5.svg', 'icons/tree_6.svg',
            'icons/tree_7.svg', 'icons/tree_8.svg', 'icons/tree_9.svg')

df <- read.csv('data.csv') %>% 
  mutate(date = as.POSIXct(date))

p1 <- ggplot(df, aes(x = date, y = trees)) +
  geom_image(aes(image = sample(images, size = length(df$trees)))) +
  labs(x = 'Date', y = 'Number of trees') +
  theme_classic()

ggsave('plot.svg', plot = p1)