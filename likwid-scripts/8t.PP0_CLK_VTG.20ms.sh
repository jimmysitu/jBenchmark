#!/bin/bash
./likwid-perfscope-ty -g PP0_CLK_VOLTAGE -t 20ms -c 0 $1 likwid-bench -s 1s -t stream_avx -w S0:1MB:8
