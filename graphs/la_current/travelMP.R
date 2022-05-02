# Accompanying code for Part 2 of OTP Tutorial

library(httr)

travelArea <- GET(
  "http://localhost:8080/otp/routers/la_current/isochrone",
  query = list(
    fromPlace = "34.056471, -118.134761", # latlong of Atlantic & Harding
    arriveBy = FALSE,
    mode = "WALK, TRANSIT", # modes we want the route planner to use
    date = "04-04-2022",
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
travelArea <- content(travelArea, as = "text", encoding = "UTF-8")

# change file path if required
write(travelArea, file = "travelMP.geojson")
