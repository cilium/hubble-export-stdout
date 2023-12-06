# skopeo inspect --override-os linux docker://busybox:1.36.1-musl  | jq -r .Digest
FROM docker.io/library/busybox:1.36.1-musl@sha256:d74cbb242cfc9c317552bfa74c166a9816b121181991b69805bc98124108b08b as busybox

FROM scratch

# Use busybox statically compiled (musl) sh implementation
COPY --from=busybox /bin/sh /bin/sh
COPY --from=busybox /bin/tail /usr/bin/tail

COPY hubble-export-stdout /usr/local/bin/hubble-export-stdout
ENTRYPOINT ["/bin/sh", "/usr/local/bin/hubble-export-stdout"]
