#!/usr/bin/bash

PIN=$1
TOGGLE=$2

gpio write $PIN $TOGGLE
