# Server

Edit the `.env` file with the propper values

Run `make <target>` to create the desired containers or `make all` to deploy everything

## Media Server

`make media-server`

- plex - media server
- transmission - torrent downloader
- jackett - index normalizer
- sonarr - tv shows PVR
- radarr - movies PVR
- bazarr - subtitles manager
- ombi - content requester for plex
 
## Home Automation

`make home-automation`

- homebridge - allows non native homekit accessories to be added to homekit
- mqtt - mosquitto server
- zigbee2mqtt - allows zigbee devices pairing without vendor's bridge/gateway
- pihole - network wide ad blocking, dns and dhcp server

## System Monitoring

`make system-monitor`

- grafana - analytics & monitoring web interface
- influxdb - time series database
- telegraf - server agent for collecting & reporting metrics
- varken - plex aggregator to influxdb
- tautulli - monitor and analytics for plex

### Retention

After installing influxdb, run `make create-retention DUR=<duration>` to set the retention duration (ns|u|µ|ms|s|m|h|d|w) for the telegraf database
