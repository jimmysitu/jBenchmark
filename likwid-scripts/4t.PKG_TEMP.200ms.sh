#!/bin/bash
./likwid-perfscope-ty -g RAPL_PKG_TEMP -t 200ms -c 0 $1 likwid-bench -s 30s -t stream_avx -w S0:1MB:4
