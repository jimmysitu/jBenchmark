#!/bin/bash
./likwid-perfscope-xy $1 -g RAPL_PP0_PP1 -t 200ms -c 0 likwid-bench -s 10s -t stream_avx -w S0:1MB:4
