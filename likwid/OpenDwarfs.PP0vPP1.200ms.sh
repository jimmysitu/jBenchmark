#!/bin/bash
./likwid-perfscope-xy $1 -g RAPL_PP0_PP1 -t 200ms -c 0 make -C ../micro-benchmark/OpenDwarfs/build test-run platform_n=1 device_n=0
