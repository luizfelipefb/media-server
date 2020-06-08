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

## Home Automation

`make home-automation`

- homebridge - allows non native homekit accessories to be added to homekit

## System Monitoring

`make system-monitor`

- grafana - analytics & monitoring web interface
- influxdb - time series database
- telegraf - server agent for collecting & reporting metrics

### Retention

After installing influxdb, run `make create-retention DUR=<duration>` to set the retention duration (ns|u|µ|ms|s|m|h|d|w) for the telegraf database
