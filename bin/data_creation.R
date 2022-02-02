x <- rnorm(100, 50, 9)

error <- rnorm(100, 0, 16)

y <- 5*x + error

output <- data.frame(x,y)

saveRDS(output, file = "example_data.rds")
