#!/bin/sh

defaultThreshold=70

diskUsage=$(df | sed s/%//g | awk -v threshold=$defaultThreshold '{ if($5 > threshold) print $0 }')
echo $diskUsage



