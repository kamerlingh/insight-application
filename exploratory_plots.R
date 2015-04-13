##exploratory plots

par(mfrow=c(1,1))
#sheet resistance versus deposition time
with(sample_data, plot(tdep, Rs_inv, 
                       xlab="deposition time (seconds)", 
                       ylab=expression(paste("inverse sheet resistance ", (Omega/sq)^-1))
                       ))

#sheet resistance versus measured thickness
with(sample_data, plot(thickness, Rs_inv, 
                       xlab="thickness (nm)", 
                       ylab=expression(paste("inverse sheet resistance ", (Omega/sq)^-1))
                       ))

par(mfrow=c(2,1))
#sheet resistance versus deposition time for different substrates
plot(sample_data$tdep, sample_data$Rs_inv, type="n",
     xlab="deposition time (s)", 
     ylab=expression(paste("inverse sheet resistance ", (Omega/sq)^-1))
)
with(sample_data[which(sample_data$substrate=="MgO"),], points(tdep, Rs_inv, col="black"))
with(sample_data[which(sample_data$substrate=="SiNx"),], points(tdep, Rs_inv, col="red"))
with(sample_data[which(sample_data$substrate=="Glass"),], points(tdep, Rs_inv, col="green"))
with(sample_data[which(sample_data$substrate=="Al2O3"),], points(tdep, Rs_inv, col="blue"))

#sheet resistance versus measured thickness for different substrates
plot(sample_data$thickness, sample_data$Rs_inv, type="n",
     xlab="thickness (nm)", 
     ylab=expression(paste("inverse sheet resistance ", (Omega/sq)^-1))
)
with(sample_data[which(sample_data$substrate=="MgO"),], points(thickness, Rs_inv, col="black"))
with(sample_data[which(sample_data$substrate=="SiNx"),], points(thickness, Rs_inv, col="red"))
with(sample_data[which(sample_data$substrate=="Glass"),], points(thickness, Rs_inv, col="green"))
with(sample_data[which(sample_data$substrate=="Al2O3"),], points(thickness, Rs_inv, col="blue"))



