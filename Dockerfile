FROM python:alpine

# Install Git
RUN apk update && \
    apk add --no-cache bash curl unzip jq

# Get Tileboard release

RUN curl -SsL -o /tmp/tileboard.zip $(curl -s https://api.github.com/repos/resoai/TileBoard/releases/latest | jq -r '.assets[].browser_download_url')

WORKDIR /tileboard
RUN unzip /tmp/tileboard.zip

EXPOSE  8000
ENTRYPOINT python3 -m http.server

# https://github.com/resoai/TileBoard/releases/download/v1.0.3/TileBoard.zip
