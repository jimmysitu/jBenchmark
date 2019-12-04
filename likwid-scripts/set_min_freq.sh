#!/bin/bash
echo 'setting:'
for x in /sys/devices/system/cpu/*/cpufreq; do
    echo $1 | sudo tee $x/scaling_min_freq;
done
echo 'result:'
cat /sys/devices/system/cpu/*/cpufreq/scaling_min_freq
