rm(list=ls())

#Task: Write the function to get a dataset from Base R: HairEyeColor
#and give the dataset a new name of your choice

dim(HairEyeColor)
data <- HairEyeColor

#See the top rows of the data
#TASK: Write the function to see the top rows of the data

tail(data,2)
head(data,2)

#Install and call the package dplyr
#TASK: Write the functions to install and call dplyr

install.packages("dplyr")
library(dplyr)

#Let's just see the hair and sex columns
#Task: Write the function to 'select' just the hair and sex columns 
#(hint: use the 'select' function)

df <- as.data.frame(data)
df %>% select(Hair,Sex)

#Let's name the dataset with just the two columns, Hair and Sex

#TASK: Write the function to save the two columns as one new dataset
#and give it a name

Hair_and_Sex <- df %>% select(Hair,Sex)
Hair_and_Sex

#Let's get rid of the Sex column in the new dataset created above
#TASK: Write the function that deselects the sex column
#(hint: use the 'select' function to not select a -column)

Hair_and_Sex %>% select(-c(Sex))

#Let's rename a column name
#TASK: Write the function that renames 'sex' to 'gender'

df %>% rename (Gender = Sex)

#Let's make a new dataset with the new column name

#TASK: Write the function that names a new dataset that includes the 'gender' column

data2 <- df %>% rename (Gender = Sex)
data2

#Let's 'filter' just the females from our dataset

#TASK: Write the function that includes only rows that are 'female'

data2_female <- data2 %>% filter(Gender == "Female")
data2_female

#Let's 'group' our data by gender

#TASK: Write the function to group the data by gender (hint: group_by)

data2 %>% group_by(Gender)%>%
	summarise(total_Freq = sum(Freq), .groups = 'drop')

#Let's see how many students were examined in the dataset (total the frequency)

#TASK: replace 'datasetname' with the name of your dataset and get the total
#TASK: After you run it, write the total here:_592_
total=mutate(datasetname, total=cumsum(Freq))

sum(data2$Freq)

#Since we have a females dataset, let's make a males dataset

#TASK: Write the function that includes only rows that are 'male'

data2_male <- data2 %>% filter(Gender == "Male")
data2_male

#And now let's join the males and females
#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')

union(data2_female, data2_male)

#Optional Task: add any of the other functions 
#you learned about from the dplyr package

data2 %>% mutate(freq_pct = round(Freq / sum(data2$Freq)*100, digits =2))
