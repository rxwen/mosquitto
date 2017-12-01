FROM alpine

MAINTAINER Raymond Wen "rx.wen218@gmail.com"

RUN apk update && apk add gcc make c-ares-dev libuuid
RUN pwd && ls -l && find . -name config.h
RUN make WITH_TLS=no binary
