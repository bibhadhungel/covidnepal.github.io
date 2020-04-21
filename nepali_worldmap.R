install.packages("rgdal")
install.packages("gpclib")
install.packages("maptool")

library(rgdal)
library(gpclib)
gpclibPermit()
library(maptools)

install.packages("Rcpp")
library(Rcpp)
install.packages("tibble")
library(tibble)

library(ggplot2)
library(dplyr)
require(maps)
require(viridis)
theme_set(
  theme_void()
)


# Create a simple map
#World map
#Retrieve the world map data:
world_map <- map_data("world")
ggplot(world_map, aes(x = long, y = lat, group = group)) +
  geom_polygon(fill="lightgray", colour = "white")


#Map for specific regions
#Retrieve map data for one or multiple specific regions:

# Some EU Contries
some.eu.countries <- c(
  "Portugal", "Spain", "France", "Switzerland", "Germany",
  "Austria", "Belgium", "UK", "Netherlands",
  "Denmark", "Poland", "Italy", 
  "Croatia", "Slovenia", "Hungary", "Slovakia",
  "Czech republic"
)

# Retrievethe map data
some.eu.maps <- map_data("world", region = some.eu.countries)

# Compute the centroid as the mean longitude and lattitude
# Used as label coordinate for country's names
region.lab.data <- some.eu.maps %>%
  group_by(region) %>%
  summarise(long = mean(long), lat = mean(lat))

#Visualize
ggplot(some.eu.maps, aes(x = long, y = lat)) +
  geom_polygon(aes( group = group, fill = region))+
  geom_text(aes(label = region), data = region.lab.data,  size = 3, hjust = 0.5)+
  scale_fill_viridis_d()+
  theme_void()+
  theme(legend.position = "none")

# Make a choropleth Map
# World map colored by corona cases
# creating nepali corona cases in world file
library(readxl)
install.packages("xlsx")
install.packages("tidyverse")
library(tidyverse)
library(xlsx)

nepali_world <- read_excel("nepali_world.xlsx")

# Merge map and life expectancy data:
world_map <- map_data("world")

#corona.map <- merge(world_map, nepali_world, by ="region")
corona.map <- left_join(nepali_world, world_map, by = "region")


# Create the choropleth map. Note that, data are missing for some region in the map below:
#Use the function geom_polygon():
ggplot(corona.map, aes(long, lat, group = group))+
  geom_polygon(aes(fill = cases ), color = 'light gray', size = 0.1)+
  ggtitle("Covid-19 positive Nepali arounf the world") + 
  guides(fill =guide_colorbar(title="Total cases")) +
  scale_fill_gradient(high = "#e34a33", low = "#fee8c8", guide = "colourbar" ) +
  theme(legend.justification=c(0,0), legend.position=c(0,0)) 
  

