#Linear Regression of Sapphire Data
# - plots deposition data in RStudio and outputs png file with both plots

#create linear regression models for deposition time and thickness
dep_Al2O3.fit <- glm(Rs_inv ~ tdep, data=sample_data[which(sample_data$substrate=="Al2O3"),])
thickness_Al2O3.fit <- glm(Rs_inv ~ thickness, data=sample_data[which(sample_data$substrate=="Al2O3"),])

#calculate the R^2 value of the fits
TSS <- sum((sample_data$Rs_inv - mean(sample_data$Rs_inv))^2)
dep_R2 <- 1 - sum(residuals(dep_Al2O3.fit)^2)/TSS
thickness_R2 <- 1 - sum(residuals(thickness_Al2O3.fit)^2)/TSS

#plot example data and regression line in RStudio
with(sample_data[which(sample_data$substrate=="Al2O3"),], 
     plot(tdep, Rs_inv, col="blue", pch=20,
          xlab="deposition time (s)", 
          ylab=expression(paste("inverse sheet resistance ", (Omega/sq)^-1)),
          main="Inverse Sheet Resistance vs. Deposition Time"))
abline(dep_Al2O3.fit, col="blue")
legend(40,0.0040, bquote(R^2 == ~ .(dep_R2)))

#export plots with overlaid linear regression lines to png
png("sapphire_analysis.png", width=500, height=1000, units = "px")
par(mfrow=c(2,1))
with(sample_data[which(sample_data$substrate=="Al2O3"),], plot(tdep, Rs_inv, col="blue", xlab="deposition time (s)", ylab=expression(paste("inverse sheet resistance ", (Omega/sq)^-1))))
legend("topleft", legend=bquote(R^2 == ~ .(dep_R2)))
abline(dep_Al2O3.fit, col="blue")
title(main="Inverse Sheet Resistance Vs. Deposition Time")

with(sample_data[which(sample_data$substrate=="Al2O3"),], plot(thickness, Rs_inv, col="blue", xlab="thickness (nm)", ylab=expression(paste("inverse sheet resistance ", (Omega/sq)^-1))))
abline(thickness_Al2O3.fit, col="blue")
title(main="Inverse Sheet Resistance Vs. Measured Thickness")
legend("topleft", legend=bquote(R^2 == ~ .(thickness_R2)))
dev.off()




