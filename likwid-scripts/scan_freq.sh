#!/bin/bash

echo "Scan frequency from $1 to $2"
./set_min_freq.sh $1;
for ((i=$1; i<=$2; i=i+100000)) do
    ./set_max_freq.sh $i
    sleep 2
done
echo "Scan frequency done"

