# Accompanying code for Part 2 of OTP Tutorial

library(httr)

serviceArea <- GET(
  "http://localhost:8080/otp/routers/la_new/isochrone",
  query = list(
    fromPlace = "34.048322, -118.098247", # latlong of South San Gabriel
    arriveBy = FALSE,
    mode = "WALK, TRANSIT", # modes we want the route planner to use
    date = "04-22-2022",
    time = "08:00am",
    maxWalkDistance = 1600, # in metres
    walkReluctance = 5,
    minTransferTime = 600, # in secs (allow 10 minutes)
    cutoffSec = 900,
    cutoffSec = 1800,
    cutoffSec = 2700,
    cutoffSec = 3600
  )
)

# convert airport_current to text
serviceArea <- content(serviceArea, as = "text", encoding = "UTF-8")

# change file path if required
write(serviceArea, file = "newTravelSSG.geojson")
