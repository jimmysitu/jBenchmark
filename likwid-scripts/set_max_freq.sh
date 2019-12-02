#!/bin/bash
for x in /sys/devices/system/cpu/*/cpufreq/; do
    echo $1 | sudo tee $x/scaling_max_freq;
done
cat /sys/devices/system/cpu/*/cpufreq/scaling_max_freq
