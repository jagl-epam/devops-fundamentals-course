#!/bin/sh

declare -i defaultThreshold=70
declare -i threshold=$1
re='[^0-9]+$'

if [[ ($1 =~ $re) || -z "$1" ]]
  then
    echo -e "\033[31;40mA number was not provided, default threshold will be used\033[0m"
    threshold=defaultThreshold
fi

diskUsage=$(df | sed s/%//g | awk -v threshold=$threshold -F "[[:space:]]+"  '{ if($5 > threshold) print $0 }')

for var in "${diskUsage[@]}"
  do
    echo "$var\n"
done