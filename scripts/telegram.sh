#!/bin/bash

# source enviroments
source `dirname $0`/.env

# poster path
poster="/tmp/poster.jpg"

# create parameters
if [ -n "${sonarr_series_id}" ]
then
  endpoint="localhost:8989/api/MediaCover/${sonarr_series_id}/poster-500.jpg?apiKey=${SONARR_API_TOKEN}"
  msg="tv show ${sonarr_series_title} s$(printf '%02d' ${sonarr_episodefile_seasonnumber})e$(printf '%02d' ${sonarr_episodefile_episodenumbers}) has been ${sonarr_eventtype,,}ed"
else
  endpoint="localhost:7878/api/MediaCover/${radarr_movie_id}/poster-500.jpg?apiKey=${RADARR_API_TOKEN}"
  msg="movie ${radarr_movie_title} has been ${radarr_eventtype,,}ed"
fi

# get poster
curl ${endpoint} > ${poster}

# send message to telegram
curl -s \
  -X POST \
  https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendPhoto \
  -F photo="@${poster}" \
  -F caption="${msg}" \
  -F chat_id=${CHAT_ID}

# remove poster
rm ${poster}
