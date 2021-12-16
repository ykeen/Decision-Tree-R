library(caTools)
library(party)
library(dplyr)
library(magrittr)
# Install the required
# Package for function
#install.packages("partykit")


dataFile <- read.csv('D:\\Uni\\Fci_Y4_T2\\ERP\\Task 4\\car-dataset.csv')
print(dataFile)

sample_data = sample.split(dataFile, SplitRatio = 0.8)
train_data <- subset(dataFile, sample_data == TRUE)
test_data <- subset(dataFile, sample_data == FALSE)
model<- ctree(nativeSpeaker ~ ., data=train_data)
plot(model)

# testing the people who are native speakers
# and those who are not
predict_model<-predict(ctree, test_data) 

# creates a table to count how many are classified 
# as native speakers and how many are not
m_at <- table(test_data$nativeSpeaker, predict_model)

ac_Test <- sum(diag(table_mat)) / sum(table)
print(paste('Accuracy for test is found to be', ac_Test))
