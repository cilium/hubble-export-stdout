# skopeo inspect --override-os linux docker://busybox:1.37.0-musl  | jq -r .Digest
FROM docker.io/library/busybox:1.37.0-musl@sha256:5b2531a497e1f4f0994272e72168d765cc54dc5da760e7bbac9c95aec383b137 AS busybox

FROM scratch

# Use busybox statically compiled (musl) sh implementation
COPY --from=busybox /bin/sh /bin/sh
COPY --from=busybox /bin/tail /usr/bin/tail

COPY hubble-export-stdout /usr/local/bin/hubble-export-stdout
ENTRYPOINT ["/bin/sh", "/usr/local/bin/hubble-export-stdout"]
