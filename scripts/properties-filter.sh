#!/bin/bash

jq '{
  playerTableStats: (.playerTableStats | map(
    del(
      .regionCode,
      .tournamentShortName,
      .firstName,
      .lastName,
      .playerId,
      .teamId,
      .height,
      .weight,
      .teamRagionName,
      .seasonId,
      .seasonName,
      .isActive,
      .isOpta,
      .tournamentId,
      .tournamentRegionId,
      .tournamentRegionCode,
      .tournamentRegionName,
      .tournamentName
    )
  )),
  paging,
  statColumns
}' data/championship-all-stats.json > data/championship-filtered-stats.json