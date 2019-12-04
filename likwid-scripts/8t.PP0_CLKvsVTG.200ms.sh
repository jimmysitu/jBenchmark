#!/bin/bash
./likwid-perfscope-xy -g PP0_CLK_VOLTAGE -t 200ms -c 0 $1 likwid-bench -s 10s -t stream_avx -w S0:1MB:8
