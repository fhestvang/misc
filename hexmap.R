library(mapDK)
library(ggmap)
library(hexamapmaker)
library(ggplot2)

kommune <- as.character(getID())
kommune_coords <- geocode(kommune, output = "latlon", source = "google") # koordinater

lon <- kommune_coords$lon*10
lat <- kommune_coords$lat*10

df <- data.frame(kommune, lon, lat)
colnames(df) <- c("id", "x", "y")

df_hex <- hexamap(df)
ggplot(df_hex, aes(x, y, group = id, fill = id)) +
  geom_polygon(alpha = 0.6) +
  coord_fixed(ratio = 1) + 
  theme(legend.position="none")

