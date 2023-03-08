# Server

Edit the `.env` file with the propper values

Run `make <target>` to create the desired containers or `make all` to deploy everything

## Home Automation

`make home-automation`

| service     | description                                                   | port |
| ----------- | ------------------------------------------------------------- | ---- |
| homebridge  | allows non native homekit accessories to be added to homekit  | 8081 |
| mqtt        | mosquitto server                                              | 8082 |
| zigbee2mqtt | allows zigbee devices pairing without vendor's bridge/gateway | N/A  |

## Media Server

`make media-server`

| service      | description                | port  |
| ------------ | -------------------------- | ----- |
| bazarr       | subtitles manager          | 6767  |
| ombi         | content requester for plex | 3579  |
| plex         | media server               | 32400 |
| prowlarr     | indexer manager            | 9696  |
| radarr       | movies PVR                 | 7878  |
| sonarr       | tv shows PVR               | 8989  |
| transmission | torrent downloader         | 9091  |

## System Monitoring

`make system-monitor`

| service  | description                                     | port |
| -------- | ----------------------------------------------- | ---- |
| grafana  | analytics & monitoring web interface            | 3000 |
| influxdb | time series database                            | 8086 |
| tautulli | monitor and analytics for plex                  | 8181 |
| telegraf | server agent for collecting & reporting metrics | N/A  |
| varken   | plex aggregator to influxdb                     | N/A  |

## System Utils

`make system-utils`

| service    | description                                            | port |
| ---------- | ------------------------------------------------------ | ---- |
| ddclient   | client used to update dynamic DNS entries for accounts | N/A  |
| homepage   | application dashboard                                  | 3001 |
| pihole     | network wide ad blocking, dns and dhcp server          | 8053 |
| portainer  | container management                                   | 9443 |
| watchtower | update the running version of your containerized apps  | N/A  |

### Retention

After installing influxdb, run `make create-retention DUR=<duration>` to set the retention duration (ns|u|µ|ms|s|m|h|d|w) for the telegraf database
