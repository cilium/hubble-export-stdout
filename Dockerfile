FROM alpine:3.12.0
RUN addgroup -S isovalent && adduser -S isovalent -G isovalent \
 && apk add --no-cache bash
USER isovalent
COPY hubble-export-stdout /usr/local/bin
