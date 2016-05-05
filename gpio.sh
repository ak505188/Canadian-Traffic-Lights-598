#!/usr/bin/bash

PIN=$1
TOGGLE=$2

gpio mode 0 out
gpio write $PIN $TOGGLE
