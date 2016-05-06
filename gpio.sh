#!/usr/bin/bash

PIN=$1
TOGGLE=$2

gpio mode 0 out
gpio mode 1 out
gpio mode 2 out
gpio mode 3 out

gpio write $PIN $TOGGLE
