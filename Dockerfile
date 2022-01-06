FROM golang:1.16-alpine

WORKDIR /app

COPY entrypoint.sh /entrypoint.sh
COPY main.go /main.go

RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]