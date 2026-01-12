# skopeo inspect --override-os linux docker://busybox:1.37.0-musl  | jq -r .Digest
FROM docker.io/library/busybox:1.37.0-musl@sha256:03db190ed4c1ceb1c55d179a0940e2d71d42130636a780272629735893292223 AS busybox

FROM scratch

# Use busybox statically compiled (musl) sh implementation
COPY --from=busybox /bin/sh /bin/sh
COPY --from=busybox /bin/tail /usr/bin/tail

COPY hubble-export-stdout /usr/local/bin/hubble-export-stdout
ENTRYPOINT ["/bin/sh", "/usr/local/bin/hubble-export-stdout"]
