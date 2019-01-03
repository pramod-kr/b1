getwd()
library(tm)
library(stringr)
library(SnowballC)
text<-readLines(file.choose())
text
text<-removeNumbers(text)
text<-removePunctuation(text)
text<-stripWhitespace(text)
textbag<-str_split(text,pattern = "\\s+")
class(textbag)
textbag<-unlist(textbag)
wordStem(textbag)

poswords<-readLines(file.choose())
poswords
score_p<-sum(!is.na(match(textbag,poswords)))
print("positive score is")
score_p

negwords<-readLines(file.choose())
negwords
score_n<-sum(!is.na(match(textbag,negwords)))
print("negative score is")
score_n

if(score_p>score_n)
{
  print("positive scores are more")
}else
  {
  print("negative scores are more")
}
  print("final score is")
  score<-abs(score_p - score_n)
  score
