#!/bin/bash
./likwid-perfscope-ty -g PP0_PP1_TEMP -t 200ms -c 0 $1 likwid-bench -s 10s -t stream_avx -w S0:1MB:4
