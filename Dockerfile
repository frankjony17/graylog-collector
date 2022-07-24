
FROM graylog/graylog:3.2

# Define build time variables
ARG build_date
ARG vcs_ref
ARG versao=1.0.0-beta.1
ARG BOM_PATH=/docker/fks

# Define environment variables that can be used in run time
ENV VERSAO=${versao} MODE=prod

# Label the container
LABEL \
    br.com.bb.image.app.sigla="fks" \
    br.com.bb.image.app.provider="" \
    br.com.bb.image.app.arch="x86_64" \
    br.com.bb.image.app.maintainer="FkSolutions / <frankjony17@gmail.com>" \
    br.com.bb.image.app.version="${versao}" \
    br.com.bb.image.description="" \
    org.label-schema.maintainer="FkSolutions / <frankjony17@gmail.com>" \
    org.label-schema.vendor="FkSolutions" \
    org.label-schema.url="https://github.com/frankjony17/graylog-collector" \
    org.label-schema.name="" \
    org.label-schema.license="COPYRIGHT" \
    org.label-schema.version="${versao}" \
    org.label-schema.vcs-url="https://github.com/frankjony17/graylog-collector" \
    org.label-schema.vcs-ref="${vcs_ref}" \
    org.label-schema.build-date="${build_date}" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.dockerfile="${BOM_PATH}/Dockerfile"

COPY config/graylog.conf /usr/share/graylog/data/config/

# web interface
EXPOSE 9000
EXPOSE 443
# gelf tcp
EXPOSE 12201
# gelf udp
EXPOSE 12201/udp
# rest api
EXPOSE 12900

CMD ["graylog"]