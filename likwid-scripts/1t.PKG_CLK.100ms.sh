#!/bin/bash
./likwid-perfscope-ty -g RAPL_PKG_CLK -t 100ms -c 0 $1 likwid-bench -s 10s -t stream_avx -w S0:1MB:1
