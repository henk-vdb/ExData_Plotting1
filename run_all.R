# sources the 4 plot-creating scripts.
# since they are self-running, no further action needed.

source("plot1.R")
source("plot2.R")
source("plot3.R")
source("plot4.R")

# See if we can show them..
for (n in 1:4) {
        dev.off()
        f <- get(paste0("Plot", n, "Base"))
        f()
        message("Displaying plot", n)
        Sys.sleep(3)
}