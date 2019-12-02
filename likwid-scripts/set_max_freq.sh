#!/bin/bash
for x in /sys/devices/system/cpu/*/cpufreq/;
    do echo 1700000 | sudo tee $x/scaling_max_freq; 
done
