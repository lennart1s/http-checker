FROM golang:1.16-alpine

RUN	apk add --no-cache \
  bash

WORKDIR /app

COPY entrypoint.sh ./entrypoint.sh
COPY httpChecker.go ./httpChecker.go
COPY go.mod ./go.mod

RUN go build

RUN chmod +x ./http-checker
RUN chmod +x ./entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]