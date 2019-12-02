#!/bin/bash
./likwid-perfscope-ty -g RAPL_PP0_PP1 -t 100ms -c 0 $1 likwid-bench -s 120s -t stream_avx -w S0:1MB:4
