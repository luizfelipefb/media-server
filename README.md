# Server

Edit the `.env` file with the propper values

Run `make <target>` to create the desired containers or `make all` to deploy everything

## Applications

`make applications`

| service  | description           | port |
| -------- | --------------------- | ---- |
| homepage | application dashboard | 3001 |
| shiori   | bookmarks manager     | 3002 |

## Home Automation

`make home-automation`

| service     | description                                                   | port |
| ----------- | ------------------------------------------------------------- | ---- |
| homebridge  | allows non native homekit accessories to be added to homekit  | 8581 |
| mqtt        | mosquitto server                                              | 1883 |
| zigbee2mqtt | allows zigbee devices pairing without vendor's bridge/gateway | 8082 |

## Media Server

`make media-server`

| service      | description                | port  |
| ------------ | -------------------------- | ----- |
| bazarr       | subtitles manager          | 6767  |
| jellyfin     | media server               | 8096  |
| overseerr    | content requester for plex | 5055  |
| plex         | media server               | 32400 |
| prowlarr     | indexer manager            | 9696  |
| radarr       | movies PVR                 | 7878  |
| sonarr       | tv shows PVR               | 8989  |
| transmission | torrent downloader         | 9091  |

## System Monitoring

`make system-monitor`

| service   | description                                     | port      |
| --------- | ----------------------------------------------- | --------- |
| grafana   | analytics & monitoring web interface            | 3000      |
| influxdb1 | time series database                            | 8087      |
| influxdb2 | time series database v2                         | 8088      |
| scrutiny  | s.m.a.r.t. monitoring                           | 8085/8086 |
| tautulli  | monitor and analytics for plex                  | 8181      |
| telegraf  | server agent for collecting & reporting metrics | N/A       |
| varken    | plex aggregator to influxdb                     | N/A       |

## System Utils

`make system-utils`

| service           | description                                            | port        |
| ----------------- | ------------------------------------------------------ | ----------- |
| ddclient          | client used to update dynamic DNS entries for accounts | N/A         |
| pihole            | network wide ad blocking, dns and dhcp server          | 8053        |
| portainer         | container management                                   | 9000/9443   |
| speedtest-tracker | wan speed test tracker                                 | 8083        |
| traefik           | HTTP reverse proxy and load balancer                   | 80/443/8080 |
| watchtower        | update the running version of your containerized apps  | 8084        |

### Retention

After installing influxdb, run `make create-retention DUR=<duration>` to set the retention duration (ns|u|µ|ms|s|m|h|d|w) for the telegraf database
