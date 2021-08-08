#!/bin/bash

jq -r '.remote_ip' nginx_json_logs \
    | awk '{seen[$1] += 1 } END { for (ip in seen) print ip, seen[ip] }' \
    | sort -g -k 2n \
    | tac \
    | head -n 10 \
    | awk '{ print "IP: "$1", Visits: "$2 }'