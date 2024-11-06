###Practice Scripts###

#-----------------------#
####    Packages     ####
#-----------------------#

library(tidyverse)
library(dplyr)
library(ggplot2)
library(patchwork)

#-----------------------#
####    Read Data    ####
#-----------------------#

#Reading in CSV as a tibble
example.data <- read.csv("../data/raw_data/bad_data_entry_example.csv") %>%
  as_tibble()

#-----------------------#
####    Data Manip   ####
#-----------------------#

unique(example.data$Site.Number)

#clean data set
clean.example.data <- example.data %>% 
  na.omit() %>% 
  rename(site.number = Site.Number) %>% 
  mutate(
    site.number = 
      case_when(site.number == "SITE 1" ~ "1",
                site.number == "site 3" ~ "3",
                TRUE ~ site.number))

unique(clean.example.data)

##save outputs as csv
write.csv(clean.example.data, "../outputs/clean.example.data.csv", row.names = FALSE)
