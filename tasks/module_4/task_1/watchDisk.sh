#!/bin/sh

declare -i defaultThreshold=70
declare -i threshold=$1
re='[^0-9]+$'

if [[ $threshold =~ $re ]]  
  then
    diskUsage=$(df | sed s/%//g | awk -v threshold=$threshold '{ if($5 > threshold) print $0 }')
  else
    echo -e "\033[31;40mA number was not provided, default threshold will be used\033[0m"
    diskUsage=$(df | sed s/%//g | awk -v threshold=$defaultThreshold -F "[[:space:]]+"  '{ if($5 > threshold) print $0 }')
fi

for var in "${diskUsage[@]}"
  do
    echo "$var\n"
done