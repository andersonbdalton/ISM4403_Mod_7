# lab 7

#Gutenburg lib 
library(gutenbergr)
library(tidyverse)
library(tidytext)
library(dplyr)

#opens any file of choice 
#Open_Any_File <- read.delim(file.choose("any file")) 
#Open_Any_File 




# no way it works
APrincessofMars <- read.delim("homework7.APrincessofMars.1.19930401.145605.txt")
AtTheEarthsCore<- read.delim("homework7.AtTheEarthsCore.2.20080619.145605.txt")
CeLaKoroDeLaTero<- read.delim("homework7.CeLaKoroDeLaTero.3.20070312.145605.txt")
IndexOfBurroughs<- read.delim("homework7.IndexOfBurroughs.4.20080617.145605.txt")
JungleTalesOfTarzan<- read.delim("homework7.JungleTalesOfTarzan.5.20080605.145605.txt")
outoftimesabyss <- read.delim("homework7.outoftime'sabyss.20.2008.07.30.145605.txt")
pelluidar <- read.delim("homework7.pelluidar.2008.07.26.14506.txt")
tarzanandthegolden<- read.delim("homework7.tarzanandthegolden.10.2019.04.11.145605.txt")
tarzanoftheapes<- read.delim("homework7.tarzanoftheapes.28.2008.06.23.145605.txt")
tarzantheuntamed<- read.delim("homework7.tarzantheuntamed.30.1998.01.28.txt")
TheBeastsOfTarzan<- read.delim("homework7.TheBeastsOfTarzan.6.20080623.145605.txt")
TheChessmenOfMars<- read.delim("homework7.TheChessmenOfMars.7.20100128.145605.txt")
TheEfficiencyExpert<- read.delim("homework7.TheEfficiencyExpert.8.20021006.145605.txt")
TheGodsOFMars<- read.delim("homework7.TheGodsOF Mars.9.20080617.145605.txt")
TheLandThatTimeForgot<- read.delim("homework7.TheLandThatTimeForgot.10.20081010.145605.txt")
TheLostContinent<- read.delim("homework7.TheLostContinent.11.2008619.145605.txt")
TheMadKing<- read.delim("homework7.TheMadKing.12.20040614.145605.txt")
TheMonsterMen<- read.delim("homework7.TheMonsterMen.13.20080619.145605.txt")
themoonmaid<- read.delim("homework7.themoonmaid.13.2019.06.14.145605.txt")
themucker<- read.delim("homework7.themucker.17..2018.03.14.145605.txt")
thuviamaidofmars<- read.delim("homework7.thuvia,maidofmars.31.1993.07.23.txt")
WarlordofMars<- read.delim("homework7.WarlordofMars.12.20120412.145605.txt")

APrincessofMars 

# turning text APrincessofMars into tidy data
APrincessofMars_re <- mutate(APrincessofMars, text = text$text)
  AP_tidy <- APrincessofMars_re %>%
  unnest_tokens(word, text)


edgar_tidy

# remove stop words 
edgar_clean <- edgar_tidy %>%
  anti_join(get_stopwords())

# word count
edgar_count <- edgar_clean %>%
  count(word, sort = TRUE)
# sentiments
bing <- get_sentiments("bing")


# positive sentiments
edgar_pos<- edgar_count <- get_sentiments("bing") %>%
  filter(sentiment == "positive")

# getting the positive and negitive sentiments
edgar_bing <- edgar_tidy %>%
  inner_join(bing) %>%
  count(word, sentiment, sort = TRUE)
# idf
edgar_idf %>%
  select(-total) %>%
  arrange(desc(tf_idf))
  
