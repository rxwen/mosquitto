FROM alpine

MAINTAINER Raymond Wen "rx.wen218@gmail.com"

RUN apk update && apk add musl-dev g++ gcc make c-ares-dev
RUN printenv
