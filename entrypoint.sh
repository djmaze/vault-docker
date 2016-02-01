#!/bin/sh
set -e

ip=$(hostname -i)

sed -i "s/{{IP}}/$ip/" /etc/vault.conf

exec /usr/local/bin/vault server -config=/etc/vault.conf $*
