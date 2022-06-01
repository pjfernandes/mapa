library(measurements)
library(sp)
library(rgdal)

df<-read.csv("coords_grid.txt", sep="/", h=T)
head(df)

long <- numeric() 
for (i in 1:nrow(df)) {
  long <- c(long, conv_unit(df$x[i] , from = "deg_min_sec", to = "dec_deg"))
}

lat <- numeric() 
for (i in 1:nrow(df)) {
  lat <- c(lat, conv_unit(df$y[i] , from = "deg_min_sec", to = "dec_deg"))
}

coord <- data.frame(x=as.numeric(long), y=as.numeric(lat))

coordinates(coord) <- c("x", "y")
shapefile(coord, "reanalise.shp")

