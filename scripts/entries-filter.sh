#!/bin/bash

# Filter playerTableStats in championship-all-stats.json to only include Leeds, Burnley, or Sunderland
jq '{
  playerTableStats: (.playerTableStats | map(select(.teamName == "Leeds" or .teamName == "Burnley" or .teamName == "Sunderland")))
}' data/championship-all-stats.json > data/championship-filtered-stats.json


jq '{
  playerTableStats: (.playerTableStats | map(select(.teamName != "Leicester" or .teamName 1= "Southampton" or .teamName 1= "Ipswich")))
}' data/championship-all-stats.json > data/championship-filtered-stats.json