#!/bin/bash

validate_ip() {
    local host=$1
    local ip=$2
    local dns_server=$3

    if [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        echo "Validating $host ($ip) using DNS server $dns_server..."
        nslookup $host $dns_server | grep -q "$ip" && echo "Valid" || echo "Invalid"
    else
        echo "Invalid IP format: $ip"
    fi
}

while IFS= read -r line; do
    host=$(echo "$line" | awk '{print $2}')
    ip=$(echo "$line" | awk '{print $1}')
    validate_ip "$host" "$ip" "8.8.8.8"
done < /etc/hosts
