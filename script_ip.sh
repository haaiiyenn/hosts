#!/bin/bash

DNS_SERVER="8.8.8.8"

echo Alex

verifica_host() {
    host=$1
    ip=$2
    dns=$3

    rezultat=$(dig +short A "$host" @"$dns")

    if echo "$rezultat" | grep -Fxq "$ip"; then
        echo "$host are IP-ul $ip"
    else
        echo "$host nu are IP-ul $ip"
    fi
}

while read ip host
do
    if [[ $ip == \#* || -z $ip ]]; then
        continue
    fi

    verifica_host "$host" "$ip" "$DNS_SERVER"

done < /etc/hosts
