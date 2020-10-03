FROM python:alpine

# Install Git
RUN apk update && \
    apk add --no-cache bash curl unzip

# Clone Tileboard
ADD https://github.com/resoai/TileBoard/releases/download/v1.0.3/TileBoard.zip /tmp/tileboard.zip

WORKDIR /tileboard
RUN unzip /tmp/tileboard.zip

EXPOSE  8000
ENTRYPOINT python3 -m http.server

# https://github.com/resoai/TileBoard/releases/download/v1.0.3/TileBoard.zip
