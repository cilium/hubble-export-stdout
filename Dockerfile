# skopeo inspect --override-os linux docker://busybox:1.37.0-musl  | jq -r .Digest
FROM docker.io/library/busybox:1.37.0-musl@sha256:ef13e7482851632be3faf5bd1d28d4727c0810901d564b35416f309975a12a30 AS busybox

FROM scratch

# Use busybox statically compiled (musl) sh implementation
COPY --from=busybox /bin/sh /bin/sh
COPY --from=busybox /bin/tail /usr/bin/tail

COPY hubble-export-stdout /usr/local/bin/hubble-export-stdout
ENTRYPOINT ["/bin/sh", "/usr/local/bin/hubble-export-stdout"]
