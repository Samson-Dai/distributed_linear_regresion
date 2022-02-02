#!/usr/bin/env Rscript

############################
# 1. Load command-line args
############################
args <- commandArgs(trailingOnly = TRUE)
n_args <- length(args)
data_fp <- args[1L]
k <- as.integer(args[2L])
i <- as.integer(args[3L])

####################
# 2. Load data frame
####################
linear_data <- readRDS(data_fp)

################################################################
# 3. Subset the data frame, fit linear model and save the result
################################################################
#assume the first col is x, the second col is y
n <- nrow(linear_data)
start <-  (i-1) * (n/k) + 1
end <- i*(n/k)

sub_x <- linear_data[start:end, 1]
sub_y <- linear_data[start:end, 2]

linear_model <- lm(sub_y ~ sub_x)
output_coef <- coef(linear_model)
saveRDS(output_coef, "raw_result.rds")

