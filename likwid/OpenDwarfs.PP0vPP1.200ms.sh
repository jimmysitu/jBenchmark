#!/bin/bash
./likwid-perfscope-xy -g RAPL_PP0_PP1 -t 200ms -c 0 $1 make -C ../micro-benchmark/OpenDwarfs/build test-run platform_n=1 device_n=0
