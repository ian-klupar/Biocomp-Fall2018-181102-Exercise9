rm(list=ls())

# load data into R
setwd("~/Desktop/intro-biocomp/class/Biocomp-Fall2018-181102-Exercise9")
df <- read.table("auto-mpg.data", header = F)

## Question 1 ##
# delete all rows with NA
df <- df[complete.cases(df)]

# name all the columns
colnames(df) <- c("mpg", "cylinders", "displacement", "horse.pwr",
                  "weight", "acc", "model.yr", "origin", "model")

# check the classes of each variable 
lapply(df, class)
# make horse power a continuous variable
df$horse.pwr <- as.numeric(df$horse.pwr)

# plot
a <- ggplot( data = df, aes(weight, mpg))
a + 
  geom_jitter() +
  geom_smooth(method = lm)

## Question 2 ##
# read in data
data <- read.csv("data.txt", header = T, sep = ',')

# look at the data
head(data)

# get dimensions and lengths of data frame
levels(data$region)
dim(data[data$region=="north",])
class(data$region)

# calculate the means
aggregate(observations ~ region, data, mean)

# barplot 
b <- ggplot(data)
b + geom_bar(aes(x = region, y = observations, fill = region),
             stat = "summary", fun.y = "mean") +
  ylab("mean")

# scatter plot
b + geom_jitter(aes(x = region, y = observations))

# yes, the two plots tell very different stories because the data from each region is 
# not equally distributed. The bar plot would have you believe that each region is very similar
# due to the means being close. However, the scatterplot shows that mean is only 
# representative of the north. The east and the west have a broad distribution which isn't
# explained by the mean and the south has no values represented by its mean. 



