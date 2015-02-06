# Exploratory Data Analysis, Course Project 1, creates the plot3.png

# The Plot3Base() function displays the graph on the screen device.
# The Plot3() function writes the graph as a png-image to disk.
# Plot3() is auto-run when script is sourced.

# The assignment says:
# "Your code file should include code for reading the data so that the plot can be fully reproduced."
# It does not say you'ld have to repeat yourself...
source("load_dataset.R")

# Creates a line graph of the three energy sub meterings.
Plot3Base <- function() {
        plot(df.hpc$Time, df.hpc[, 7], type = "l", col = "black",
             xlab = "",
             ylab = "Energy sub metering")
        lines(df.hpc$Time, df.hpc[, 8], col="red")
        lines(df.hpc$Time, df.hpc[, 9], col="blue")
        legend("topright", legend = names(df.hpc)[7:9],
               lty=1, col = c("black", "red", "blue"))  
}

# Creates a png-image of a line graph of the three energy sub meterings.
Plot3 <- function() {
        png("plot3.png") # default width = 480, height = 480
        Plot3Base()
        dev.off()
}

Plot3()