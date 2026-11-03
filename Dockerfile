# BuildGrid phase 4 egress test: a RUN step with no registry login, from the dima account; see probe.sh
FROM alpine:3.20
RUN apk add --no-cache curl
COPY probe.sh /probe.sh
RUN sh /probe.sh
