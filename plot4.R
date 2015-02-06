# Exploratory Data Analysis, Course Project 1, creates the plot4.png

# The Plot4Base() function displays the graph on the screen device.
# The Plot4() function writes the graph as a png-image to disk.
# Plot4() is auto-run when script is sourced.

# The assignment says:
# "Your code file should include code for reading the data so that the plot can be fully reproduced."
# It does not say you'ld have to repeat yourself...
source("load_dataset.R")

# Creates 4 plots:
# - line graph of global active power,
# - line graph of voltage,
# - line graph of three energy sub meterings,
# - line graph of global reactive power.
Plot4Base <- function() {
        par(mfcol = c(2, 2))
        
        # top-left
        plot(df.hpc$Time, df.hpc$Global_active_power, type = "l",
             xlab = "",
             ylab = "Global Active Power")
        
        # bottom-left
        plot(df.hpc$Time, df.hpc[, 7], type = "l", col = "black",
             xlab = "",
             ylab = "Energy sub metering")
        lines(df.hpc$Time, df.hpc[, 8], col="red")
        lines(df.hpc$Time, df.hpc[, 9], col="blue")
        legend("topright", legend = names(df.hpc)[7:9],
               lty=1, col = c("black", "red", "blue"), bty = "n")
        
        # top-right
        plot(df.hpc$Time, df.hpc$Voltage, type = "l",
             xlab = "datetime",
             ylab = "Voltage")
        
        # bottom-right
        plot(df.hpc$Time, df.hpc$Global_reactive_power, type = "l",
             xlab = "datetime",
             ylab = "Global_reactive_power")
}
        

# Creates a png-image of 4 plots:
# - line graph of global active power,
# - line graph of voltage,
# - line graph of three energy sub meterings,
# - line graph of global reactive power.
Plot4 <- function() {
        png("plot4.png") # default width = 480, height = 480
        Plot4Base()
        dev.off()
}

Plot4()
