# skopeo inspect --override-os linux docker://busybox:1.36.0-musl  | jq -r .Digest
FROM docker.io/library/busybox:1.36.0-musl@sha256:b6252cc4d3a3a702284d828b89cf99d902fad4b00b4aebf2299aa15bfeae54bf as busybox

FROM scratch

# Use busybox statically compiled (musl) sh implementation
COPY --from=busybox /bin/sh /bin/sh
COPY --from=busybox /bin/tail /usr/bin/tail

COPY hubble-export-stdout /usr/local/bin/hubble-export-stdout
ENTRYPOINT ["/bin/sh", "/usr/local/bin/hubble-export-stdout"]
