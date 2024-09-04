---
title: "Homework DSB 10"
author: "Sathianphong Ball"
date: "2024-07-20"
output:
  html_document: default
  pdf_document: default
---
# Welcome to my first analysis data 
## In diamonds shop

### let's go !

### Now,we're get data about visualization!
```{r}
library(tidyverse)
library(dplyr)
```

##**Primary,create df from dataset**
```{r}
set.seed(50)
df1 <- diamonds %>% 
  sample_frac(0.1)
```

### Would diamonds are the best interesting?

```{r}

##ggplot to base2

base2 <- ggplot(df1,aes(carat,price,col = cut))+
    geom_point(alpha = 0.8)+
    geom_smooth()+
    facet_wrap(~cut,nrow = 2)+
    theme_minimal()

##Create the name

base2 +
  labs(title = "Which cut is most interesting?",
           subtitle = "Decision with price and carat ",
           x = "price",
           y = "carat")

```

### look relationship with color and cut 

```{r}
base3 <- ggplot(df1 %>% filter(cut %in% c("Very Good","Premium","Ideal")), aes(x = carat, y = price, fill = cut)) +
  geom_point(aes(shape = cut,color = cut))+
  facet_wrap(~color)+
  theme_minimal()

## Create the name
base3 +
  labs(title = "Top 3 of cut diamonds",
       subtitle = "Group by color ",
       x = "price",
       y = "carat")

```
### Also we're talk about clarity in this shop

```{r}
base4 <- ggplot(df1,aes(clarity,fill = cut))+
  geom_bar(position = "dodge",color = "black")+
  theme_light()

base4 + 
  labs(title = "Total clarity",
       subtitle = "Group by color ",
       x = "Amount of diamonds",
       y = "Clarity")

```
### Ideal cut is the most amount each a clarity

### Price is easy decision on your money 
### If you choose color first also look around price below.

```{r}
base5 <- ggplot(df1,aes(carat,price,fill = color))+
  geom_bin2d(binwidth = c(0.5,1000))+
  facet_wrap(~cut)+
  theme_light()

base5 +  
  labs(title = "Heat map about color",
              subtitle = "Group by cut ",
              x = "price",
              y = "carat")
```
### And we found ideal cut is interested 
### Analysis with ideal cut only!

```{r}
set.seed(42)
df_i <- diamonds %>% 
    sample_frac(0.1) %>% 
    filter(cut == "Ideal")
```

```{r}
base1 <- ggplot(df_i,aes(clarity, fill = clarity))+
  geom_bar(col = "black")+
  theme_minimal()
  
##Create the name
base1 + 
  labs(title = "Ideal Diamond",
       subtitle = "The best cut in diamond is Ideal",
       x = "clarity type",
       y = "Count of Ideal")
```
### the last one we're summary range of price each a cut !

```{r}
base6 <- ggplot(df1,aes(cut,price,col = cut))+
  geom_boxplot()+
  coord_flip()+
  theme_light()

## create name
base6 +
  labs(title = "Box plot chart of price",
              subtitle = "Group by cut ",
              y = "price($)",
              x = "Quanlity of cut")
```
## I am grateful for your continued support.

