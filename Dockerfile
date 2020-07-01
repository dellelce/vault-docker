FROM alpine:3.12

ARG VERSION=1.4.1
ARG FULLURL=https://releases.hashicorp.com/vault/${VERSION}/vault_${VERSION}_linux_amd64.zip


RUN set -x && wget -O /bin/vault.zip $FULLURL && cd /bin && \
    unzip vault.zip && rm vault.zip && vault version 
