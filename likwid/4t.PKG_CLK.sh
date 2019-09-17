#!/bin/bash
./likwid-perfscope --host 192.168.31.87 --user jmst -g RAPL_PKG_CLK -t 200ms -c 0 likwid-bench -s 10s -t stream_avx -w S0:1MB:4
