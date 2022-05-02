# skopeo inspect --override-os linux docker://busybox:1.35.0-musl  | jq -r .Digest
FROM docker.io/library/busybox:1.35.0-musl@sha256:3881f057b3ef544b9b2d6148028322b7fca0e81569ebdf8524a1aa540cf54de4 as busybox

FROM scratch

# Use busybox statically compiled (musl) sh implementation
COPY --from=busybox /bin/sh /bin/sh
COPY --from=busybox /bin/tail /usr/bin/tail

COPY hubble-export-stdout /usr/local/bin/hubble-export-stdout
ENTRYPOINT ["/bin/sh", "/usr/local/bin/hubble-export-stdout"]
