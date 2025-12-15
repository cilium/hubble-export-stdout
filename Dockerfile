# skopeo inspect --override-os linux docker://busybox:1.37.0-musl  | jq -r .Digest
FROM docker.io/library/busybox:1.37.0-musl@sha256:b259afe60d4b88dbdb31908ca9524ef5308afd01aea17f4ce44ddb3c6a882929 AS busybox

FROM scratch

# Use busybox statically compiled (musl) sh implementation
COPY --from=busybox /bin/sh /bin/sh
COPY --from=busybox /bin/tail /usr/bin/tail

COPY hubble-export-stdout /usr/local/bin/hubble-export-stdout
ENTRYPOINT ["/bin/sh", "/usr/local/bin/hubble-export-stdout"]
