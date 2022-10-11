FROM alpine:latest

RUN apk update && apk add bind-tools socat netcat-openbsd && rm -rf /var/cache/apk/*

ENTRYPOINT ["nc"]
