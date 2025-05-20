#!/bin/bash

# source enviroments
source `dirname $0`/.env

# poster path
poster="/tmp/poster.jpg"

# create parameters
if [ -n "${sonarr_series_id}" ]
then
  endpoint="10.69.4.20:8989/api/MediaCover/${sonarr_series_id}/poster-500.jpg?apiKey=${SONARR_APIKEY}"
  msg="tv show ${sonarr_series_title} s$(printf '%02d' ${sonarr_episodefile_seasonnumber})e$(printf '%02d' ${sonarr_episodefile_episodenumbers}) has been ${sonarr_eventtype,,}ed"
else
  endpoint="10.69.4.20:7878/api/MediaCover/${radarr_movie_id}/poster-500.jpg?apiKey=${RADARR_APIKEY}"
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
