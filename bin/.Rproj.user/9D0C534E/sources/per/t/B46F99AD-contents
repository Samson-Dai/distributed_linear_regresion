#!/usr/bin/env Rscript

########################################
# 1. Load command-line args
########################################
args <- commandArgs(trailingOnly = TRUE)
n_args <- length(args)
result_file_name <- args[1L]
raw_result_fps <- args[seq(2L, n_args)]

####################
# 2. Load coefs
####################
fitted_ceofs <- lapply(raw_result_fps, readRDS)

################################################################
# 3. Subset the data frame, fit linear model and save the result
################################################################
#assume the first col is x, the second col is y
intercepts <- sapply(fitted_ceofs, function(x) x[[1]])
slopes <- sapply(fitted_ceofs, function(x) x[[2]])

avg_intercept <- mean(intercepts)
avg_slope <- mean(slopes)

out <- data.frame(avg_intercept, avg_slope)
saveRDS(out, result_file_name)
