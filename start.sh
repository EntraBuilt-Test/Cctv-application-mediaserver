#!/bin/sh
set -e

PORT="${PORT:-8080}"
sed "s/__PORT__/${PORT}/" /nginx.conf.template > /etc/nginx/http.d/default.conf

echo "Starting MediaMTX (internal HLS :8888, internal API :9997)"
/mediamtx /mediamtx.yml &

echo "Starting nginx on public port ${PORT} (proxies / -> HLS, /control/ -> API)"
exec nginx -g "daemon off;"
