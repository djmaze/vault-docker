FROM alpine

RUN apk add --update curl \
 && curl -sSL -o "/tmp/vault.zip" https://releases.hashicorp.com/vault/0.4.1/vault_0.4.1_linux_amd64.zip \
 && cd /usr/local/bin \
 && unzip -o "/tmp/vault.zip" \
 && chmod +x vault && rm "/tmp/vault.zip" \
 && apk del curl \
 && rm /var/cache/apk/* -fR

COPY entrypoint.sh /entrypoint.sh
COPY vault.conf /etc/vault.conf

ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 9200/tcp
