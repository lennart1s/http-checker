FROM golang:1.16-alpine

RUN	apk add --no-cache \
  bash

WORKDIR /app

COPY httpChecker.go ./httpChecker.go
COPY go.mod ./go.mod

RUN go build

RUN chmod +x ./http-checker

ENTRYPOINT ["/app/http-checker"]