FROM debian:stable-slim

RUN apt update && apt install -y netcat && rm -rf /var/lib/apt/lists/*
