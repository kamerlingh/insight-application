#Linear Regression of Sapphire Data
# - plots data in RStudio and outputs png file

#create linear regression models for deposition time and thickness
dep_Al2O3.fit <- glm(Rs_inv ~ tdep, data=sample_data[which(sample_data$substrate=="Al2O3"),])
thickness_Al2O3.fit <- glm(Rs_inv ~ thickness, data=sample_data[which(sample_data$substrate=="Al2O3"),])

#plot data and regression line in RStudio
par(mfrow=c(2,1), mar=c(4,4,2,2))

with(sample_data[which(sample_data$substrate=="Al2O3"),], plot(tdep, Rs_inv, col="blue", xlab="deposition time (s)", ylab=expression(paste("inverse sheet resistance ", (Omega/sq)^-1))))
abline(dep_Al2O3.fit, col="blue")

with(sample_data[which(sample_data$substrate=="Al2O3"),], plot(thickness, Rs_inv, col="blue", xlab="thickness (nm)", ylab=expression(paste("inverse sheet resistance ", (Omega/sq)^-1))))
abline(thickness_Al2O3.fit, col="blue")

#export plots with overlaid linear regression lines to png
png("sapphire_analysis.png", width=500, height=1000, units = "px")
par(mfrow=c(2,1))
with(sample_data[which(sample_data$substrate=="Al2O3"),], plot(tdep, Rs_inv, col="blue", xlab="deposition time (s)", ylab=expression(paste("inverse sheet resistance ", (Omega/sq)^-1))))
abline(dep_Al2O3.fit, col="blue")
title(main="Inverse Sheet Resistance Vs. Deposition Time")

with(sample_data[which(sample_data$substrate=="Al2O3"),], plot(thickness, Rs_inv, col="blue", xlab="thickness (nm)", ylab=expression(paste("inverse sheet resistance ", (Omega/sq)^-1))))
abline(thickness_Al2O3.fit, col="blue")
title(main="Inverse Sheet Resistance Vs. Measured Thickness")
dev.off()




