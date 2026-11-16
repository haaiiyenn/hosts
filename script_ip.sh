#!/bin/bash
while read ip host
do
	if [[ $ip == \#* || -z $ip ]]; then
		continue
	fi

	IFS='.' read -r a b c d <<< "$ip"

    if [[ $a =~ ^[0-9]+$ && $b =~ ^[0-9]+$ && $c =~ ^[0-9]+$ && $d =~ ^[0-9]+$ ]] &&
       (( a <= 255 && b <= 255 && c <= 255 && d <= 255 )); then
        echo "$ip este valid"
    else
        echo "$ip este invalid"
    fi

done < /etc/hosts
