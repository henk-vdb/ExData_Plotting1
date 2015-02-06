# Exploratory Data Analysis, Course Project 1, creates the plot2.png

# The Plot2Base() function displays the graph on the screen device.
# The Plot2() function writes the graph as a png-image to disk.
# Plot2() is auto-run when script is sourced.

# The assignment says:
# "Your code file should include code for reading the data so that the plot can be fully reproduced."
# It does not say you'ld have to repeat yourself...
source("load_dataset.R")

# Creates a line graph of the global active power.
Plot2Base <- function() {
        plot(df.hpc$Time, df.hpc$Global_active_power, type = "l",
             xlab = "",
             ylab = "Global Active Power (kilowatts)")  
}

# Creates a png-image of a line graph of the global active power.
Plot2 <- function() {
        # png defaults:
        # default width = 480, height = 480
        # default bg = "white", but the images on the projet page are transparent!
        png("plot2.png", bg = NA) 
        Plot2Base()
        dev.off()
}

Plot2()