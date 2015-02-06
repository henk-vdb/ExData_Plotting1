# Data for the graph is expected at "data/household_power_consumption.txt"
# or, alternatively, at "household_power_consumption.txt"


# Load, subset and format the dataset.
# Push it to the global environment so we don't have to load it for each graph.
LoadDataset <- function(reload = FALSE) {
        if (!exists("df.hpc") | reload) {
                
                filename <- "data/household_power_consumption.txt"
                filename.alt <- "household_power_consumption.txt"
                if (file.exists(filename.alt)) filename <- filename.alt
                
                if (!file.exists(filename)) {
                        # OK. Download the stuff.
                        source("load_data.R")
                }
                        
                message("Loading dataset '", filename, 
                        "'. This may take a while...")
                
                df <- read.csv2(filename, na.strings = "?", dec = ".", 
                                     stringsAsFactor = FALSE)
                df <- df[grepl("^(1|2){1}/2/2007$", df$Date), ]
                df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
                df$Time <- strptime(paste(format(df$Date, "%Y-%m-%d"), df$Time), 
                                    format = "%Y-%m-%d %H:%M:%S")
                
                df.hpc <<- df
                message("Data frame 'df.hpc' has data from date range ", 
                        paste(unique(df.hpc$Date), collapse = " - "))
        }     
}

LoadDataset()