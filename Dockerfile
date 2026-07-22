FROM bluenviron/mediamtx:latest AS mediamtx

FROM alpine:3.20
RUN apk add --no-cache ffmpeg nginx
COPY --from=mediamtx /mediamtx /mediamtx
COPY mediamtx.yml /mediamtx.yml
COPY nginx.conf.template /nginx.conf.template
COPY start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]
