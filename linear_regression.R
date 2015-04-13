##plots with linear regression exported to png files, writes table of values to console

#create linear regression models for deposition time and thickness
dep_Al2O3.fit <- glm(Rs_inv ~ tdep, data=sample_data[which(sample_data$substrate=="Al2O3"),])
thickness_Al2O3.fit <- glm(Rs_inv ~ thickness, data=sample_data[which(sample_data$substrate=="Al2O3"),])

#looking only at data for sapphire (Al2O3)
par(mfrow=c(2,1))
with(sample_data[which(sample_data$substrate=="Al2O3"),], plot(tdep, Rs_inv, col="blue", xlab="deposition time (s)", ylab=expression(paste("inverse sheet resistance ", (Omega/sq)^-1))))
abline(dep_Al2O3.fit, col="blue")

with(sample_data[which(sample_data$substrate=="Al2O3"),], plot(thickness, Rs_inv, col="blue", xlab="thickness (nm)", ylab=expression(paste("inverse sheet resistance ", (Omega/sq)^-1))))
abline(thickness_Al2O3.fit, col="blue")

#export plots with overlaid linear regression lines to png





