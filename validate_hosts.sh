#!/bin/bash

while IFS= read -r line; do
	ip=$(echo "$line" | awk '{print $1}')
	if [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
		echo "Ip valid: $ip"
	else
		echo  "Ip invalid : $ip"
	fi
done </etc/hosts
