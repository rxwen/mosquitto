FROM alpine

MAINTAINER Raymond Wen "rx.wen218@gmail.com"

RUN apk update && apk add gcc make libuuid
RUN pwd && ls -l
RUN make WITH_SRV=no WITH_TLS=no binary
