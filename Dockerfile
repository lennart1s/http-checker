# Base image 
FROM golang:1.16-alpine

# installes required packages for our script
RUN	apk add --no-cache \
  bash \
  ca-certificates \
  curl \
  jq

# Copies your code file  repository to the filesystem 
COPY entrypoint.sh /entrypoint.sh
COPY httpChecker.go /httpChecker.go

# change permission to execute the script and
RUN chmod +x /entrypoint.sh

# file to execute when the docker container starts up
ENTRYPOINT ["/entrypoint.sh"]