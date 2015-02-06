# Exploratory Data Analysis, Course Project 1, creates the plot1.png

# The Plot1Base() function displays the graph on the screen device.
# The Plot1() function writes the graph as a png-image to disk.
# Plot1() is auto-run when script is sourced.

# The assignment says:
# "Your code file should include code for reading the data so that the plot can be fully reproduced."
# It does not say you'ld have to repeat yourself...
source("load_dataset.R")

# Creates a histograph of the global active power.
Plot1Base <- function() {
        hist(df.hpc$Global_active_power, col = "red", 
             main = "Global Active Power",
             xlab = "Global Active Power (kilowatts)")
}

# Creates a png-image of a histograph of the global active power.
Plot1 <- function() {
        # png defaults:
        # default width = 480, height = 480
        # default bg = "white", but the images on the projet page are transparent!
        png("plot1.png", bg = NA) 
        Plot1Base()
        dev.off()
}

Plot1()