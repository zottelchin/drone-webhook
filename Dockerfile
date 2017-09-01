FROM alpine:3.6 as alpine
RUN apk add -U --no-cache ca-certificates

FROM scratch
MAINTAINER Drone.IO Community <drone-dev@googlegroups.com>

ENV GODEBUG=netdns=go

COPY --from=alpine /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

LABEL org.label-schema.version=latest
LABEL org.label-schema.vcs-url="https://github.com/drone-plugins/drone-webhook.git"
LABEL org.label-schema.name="Drone S3 Webhook"
LABEL org.label-schema.vendor="Drone.IO Community"


ADD release/linux/amd64/drone-webhook /bin/
ENTRYPOINT ["/bin/drone-webhook"]
