#Exploratory Plots

par(mfrow=c(1,1), mar=c(5.1,4.1,2.1,2.1))

#inverse sheet resistance versus deposition time
plot(sample_data$tdep, sample_data$Rs_inv, type="n",
     xlab="deposition time (s)", 
     ylab=expression(paste("inverse sheet resistance ", (Omega/sq)^-1)),
     main="Inverse Sheet Resistance vs. Deposition Time"
)

with(sample_data[which(sample_data$substrate=="MgO"),], points(tdep, Rs_inv, col="gray", pch=20))
with(sample_data[which(sample_data$substrate=="SiNx"),], points(tdep, Rs_inv, col="red", pch=20))
with(sample_data[which(sample_data$substrate=="Glass"),], points(tdep, Rs_inv, col="green", pch=20))
with(sample_data[which(sample_data$substrate=="Al2O3"),], points(tdep, Rs_inv, col="blue", pch=20))

legend(225,0.0095,
       c("MgO","SiNx", "Glass", "Sapphire"),
       pch=c(20,20,20,20),
       col=c("gray", "red", "green", "blue"))

#inverse sheet resistance versus measured thickness
plot(sample_data$thickness, sample_data$Rs_inv, type="n",
     xlab="thickness (nm)", 
     ylab=expression(paste("inverse sheet resistance ", (Omega/sq)^-1)),
     main="Inverse Sheet Resistance vs. Measured Thickness"
)

with(sample_data[which(sample_data$substrate=="MgO"),], points(thickness, Rs_inv, col="gray", pch=20))
with(sample_data[which(sample_data$substrate=="SiNx"),], points(thickness, Rs_inv, col="red", pch=20))
with(sample_data[which(sample_data$substrate=="Glass"),], points(thickness, Rs_inv, col="green", pch=20))
with(sample_data[which(sample_data$substrate=="Al2O3"),], points(thickness, Rs_inv, col="blue", pch=20))

legend(225,0.0095,
       c("MgO","SiNx", "Glass", "Sapphire"),
       pch=c(20,20,20,20),
       col=c("gray", "red", "green", "blue"))
