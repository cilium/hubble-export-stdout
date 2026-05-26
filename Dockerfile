# skopeo inspect --override-os linux docker://busybox:1.37.0-musl  | jq -r .Digest
FROM docker.io/library/busybox:1.38.0-musl@sha256:8635836765b0c4c43970660219739baa58b0883c2e429e4b8918f7dd1519455c AS busybox

FROM scratch

# Use busybox statically compiled (musl) sh implementation
COPY --from=busybox /bin/sh /bin/sh
COPY --from=busybox /bin/tail /usr/bin/tail

COPY hubble-export-stdout /usr/local/bin/hubble-export-stdout
ENTRYPOINT ["/bin/sh", "/usr/local/bin/hubble-export-stdout"]
