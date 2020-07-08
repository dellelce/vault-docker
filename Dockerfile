FROM alpine:3.12

# Actual version to be provided by upstream script
ARG VERSION=1.4.1
ARG FULLURL=https://releases.hashicorp.com/vault/${VERSION}/vault_${VERSION}_linux_amd64.zip

RUN wget -O /bin/vault.zip $FULLURL && cd /bin && \
    unzip vault.zip vault && rm vault.zip && vault version

VOLUME ["/vault"]

ENTRYPOINT ["/bin/vault"]

CMD ["server", "-config=/vault/config.hcl"]
