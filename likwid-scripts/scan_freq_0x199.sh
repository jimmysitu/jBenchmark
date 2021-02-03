#!/bin/bash

echo "Scan frequency from $1 to $2"
for ((i=$1; i<=$2; i=i+0x100)) do
    printf "setting 0x%x\n" $i
    sudo wrmsr -a 0x199 $i
    echo "result:"
    sudo rdmsr -a 0x198
    sleep 2
done
echo "Scan frequency done"

