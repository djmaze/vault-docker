#!/bin/sh
set -e

ip=$(ip address show dev eth0 | grep "inet " | awk '{ print $2 }' | awk -F'/' '{print $1}')

sed -i "s/{{IP}}/$ip/" /etc/vault.conf

exec /usr/local/bin/vault server -config=/etc/vault.conf $*
