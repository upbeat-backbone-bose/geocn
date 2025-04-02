#!/bin/sh
while true;
do
    date
    echo "updating GeoLite2-City.mmdb..."
    curl  -L -o "GeoLite2-City.mmdb" "https://gh-proxy.com/github.com/P3TERX/GeoLite.mmdb/raw/download/GeoLite2-City.mmdb"
    echo "updating GeoLite2-ASN.mmdb..."
    curl  -L -o "GeoLite2-ASN.mmdb" "https://gh-proxy.com/github.com/P3TERX/GeoLite.mmdb/raw/download/GeoLite2-ASN.mmdb"
    echo "updating GeoCN.mmdb..."
    curl  -L -o "GeoCN.mmdb" "https://gh-proxy.com/github.com/ljxi/GeoCN/releases/download/Latest/GeoCN.mmdb"

    echo "restarting uvicorn..."
    pkill -f "uvicorn"
    nohup uvicorn main:app --host 0.0.0.0 --port 8080 --no-server-header --proxy-headers &
    sleep 86400;
done
