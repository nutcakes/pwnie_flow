#!/bin/bash
while true; do
    ip=$(ip -4 addr show 2>/dev/null |
        grep -oP 'inet \K10\.12\.194\.[0-9]+' |
        head -n 1)

    if [ -n "$ip" ]; then
        echo "IP encontrado: $ip"
        echo "Você pode conectar via SSH:"
        echo "ssh pi@10.12.194.1"
        break
    fi

    echo "Aguardando interface do Pwny..."
    sleep 2
done
