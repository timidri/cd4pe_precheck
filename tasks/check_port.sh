#!/bin/bash

output=$(curl -s -S --connect-timeout 1 $PT_host:$PT_port 2>&1)
value=$(echo $?)
case $value in
    56) 
        if [[ "${PT_port}" == '22' ]]; then
            echo "OK: SSH port $PT_port likely available on $PT_host"; exit 0
        fi
    ;;
    0)
        echo "WARNING: Port $PT_port likely occupied by running service on $PT_host"; exit 2
    ;;
    7)
        if [[ "${output}" =~ ^.*Connection\ refused$ ]]; then
          if [[ "${PT_port}" == '22' ]]; then
            echo "FAIL: $PT_host not listening for SSH at $PT_port"; exit 3
          fi
          echo "OK: Port $PT_port likely open and unoccupied on $PT_host"; exit 0
        else
          echo "FAIL: Port $PT_port likely blocked to $PT_host"; exit 3
        fi
    ;;
    6)
        echo "FAIL: DNS error resolving $PT_host"; exit 3
    ;;
    *)
        echo "ERROR: Unexpected results testing $PT_host for $PT_port"; exit 1
    esac