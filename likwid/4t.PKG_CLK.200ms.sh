#!/bin/bash
./likwid-perfscope-ty $1 -g RAPL_PKG_CLK -t 200ms -c 0 likwid-bench -s 10s -t stream_avx -w S0:1MB:4
