#!/bin/bash
# Use with the following .rtorrent.rc configuration directive:
# system.method.set_key = event.download.finished,torrentfinished,"execute=/home/rtorrent/torrentfinished.sh,$d.get_name="

curl -H "Content-Type: application/json" -H "X-Auth-Token: tokenhere" -X POST -d "{\"name\":\"$1\"}" https://automation.ub3rk1tten.com/torrent/finished