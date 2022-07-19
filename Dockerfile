# syntax=docker/dockerfile:1.4

FROM eclipse-temurin:17
COPY --link --from=ghcr.io/devinrsmith/deephaven-server:0.14.0-scratch /opt/deephaven /opt/deephaven
COPY --link config/ /opt/deephaven/config/
VOLUME /data
VOLUME /cache
EXPOSE 10000
HEALTHCHECK --interval=5s --timeout=3s CMD curl --fail http://localhost:10000 || exit 1
ENTRYPOINT [ "/opt/deephaven/server-jetty/bin/start", "/opt/deephaven/config/image-bootstrap.properties" ]
