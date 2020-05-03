#!/bin/sh
while sleep 30
do
	if ping -q -c 2 -W 5 feed.adsbexchange.com >/dev/null 2>&1
	then
		echo Connected to feed.adsbexchange.com:"${RECEIVER_PORT:-30005}"
                echo Feeding from "$INPUT"
		socat -u TCP:"$INPUT" TCP:feed.adsbexchange.com:"${RECEIVER_PORT:-30005}"
		echo Disconnected
	else
		echo Unable to connect to feed.adsbexchange.com, trying again in 30 seconds!
	fi
done
