#!/bin/sh -

privateip="$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')"

publicip="$(curl icanhazip.com)"

killall -9 mtproto-proxy

launch ="$(cd /root/MTProxy/objs/bin && ./mtproto-proxy -u nobody --aes-pwd proxy-secret proxy-multi.conf -M 2 -p 8893 -H 443 -S 00000000000000000000000000000000 -D hajhosseinam.cdninstagram.com --nat-info $privateip:$publicip)"

eval $launch
