#!/usr/bin/bash

gpio mode 0 out && \
gpio mode 1 out && \
gpio mode 2 out && \
gpio mode 3 out

result=$?
if [ $result -eq 127 ]; then
	echo "Either you are not on a Raspberry Pi"
	echo "or there was issue with the gpio command."
	echo
	exit 127;
fi
