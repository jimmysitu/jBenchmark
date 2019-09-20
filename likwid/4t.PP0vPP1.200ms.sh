#!/bin/bash
./likwid-perfscope-xy -g RAPL_PP0_PP1 -t 200ms -c 0 $1 likwid-bench -s 100s -t stream_avx -w S0:1MB:4
