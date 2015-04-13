#use apply type of function to test for zeros


##load sample data from xlsx file
library(xlsx)
colIndex <- c(1,2,3,4,20)
rowIndex <- 3:1383
sample_data <- read.xlsx("sample_database.xlsx", sheetIndex=1, rowIndex=rowIndex, colIndex=colIndex)

##tidy data: rename columns, remove incomplete cases, use consistent names
names(sample_data) <- c('id', 'substrate', 'thickness', 'Rs', 'tdep')

#incomplete cases have zero values
complete <- !(sample_data[,2]==0 | sample_data[,3]==0 | sample_data[,4]==0 | sample_data[,5]==0)
sample_data <- sample_data[complete,]

#incomplete cases also have '<NA>' and non-numeric values in thickness column
complete <- !(is.na(as.numeric(as.character(sample_data[,3]))))
sample_data <- sample_data[complete,]

#coerce thickness and tdep into numeric (from factor)
sample_data[,3] <- as.numeric(as.character(sample_data[,3]))
sample_data[,5] <- as.numeric(as.character(sample_data[,5]))

#remove thickness data for samples thicker than 10 nm (reasonable transmissometer range)
sample_data <- sample_data[sample_data[,3]<=10,]

#remove anomalous Rs data (mistaken comma instead of period in original data?)
sample_data <- sample_data[sample_data[,4]<20000,]

#multiple labels for SiNx exist ("SiNx" and "Sinx")
wrong_label <- sample_data[,2]=="Sinx"
sample_data[wrong_label,][,2] <- "SiNx"

##add column for the inverse of the sheet resistance
sample_data <- mutate(sample_data, Rs_inv = 1/Rs)