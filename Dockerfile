FROM alpine:latest

RUN apk update && apk add bind-tools netcat-openbsd && rm -rf /var/cache/apk/*

ENTRYPOINT ["nc"]
