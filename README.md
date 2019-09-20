

# jmBenchmark

Jimmy's Benchmark

Some useful tools

- x86_energy_perf_policy

  - Help to enable and setting hwp and turbo

- CoreFreq

  - Help check hardware function support or not, enable or not

- PowerTop

  - Energy status tracking like top

- perf

  - Display energy status with Linux sysfs
  - ```bash
    perf stat -e power/energy-pkg/,power/energy-cores/,cycle -I 1000 sleep 1000
    ```

### Prerequisites

```bash
sudo apt install libpapi-dev
```

- For OpenCL benchmarks OpenDwarfs, need Intel OpenCL runtime for GPU/CPU

  

### Useful MSRs

| Register Address | Register Name          | Bit Description                    |
| ---------------- | ---------------------- | ---------------------------------- |
|                  |                        |                                    |
|                  |                        |                                    |
| 610H             | gitMSR_PKG_POWER_LIMIT | PKG RAPL Power Limit Control (R/W) |
| 614H             | MSR_PKG_POWER_INFO     | PKG RAPL Parameters (R/W)          |
| 638H             | MSR_PP0_POWER_LIMIT    | PP0 RAPL Power Limit Control (R/W) |
| 639H             | MSR_PP0_ENERGY_STATUS  | PP0 Energy Status (R/O)            |
| 63AH             | MSR_PP0_POLICY         | PP0 Balance Policy (R/W)           |
| 640H             | MSR_PP1_POWER_LIMIT    | PP1 RAPL Power Limit Control (R/W) |
| 641H             | MSR_PP1_ENERGY_STATUS  | PP1 Energy Status (R/O)            |
| 642H             | MSR_PP1_POLICY         | PP1 Balance Policy (R/W)           |





## likwid

- likwid-perfscope

  ​	likwid-perfscope is a modify version of the one in likwid. The major update is add sudo execute on remote host. You need double type your sudo password of your remote host and the second type will not print any message since stdout is redirected.

  



## Micro-Benchmark

### OpenDwarfs

- The OpenDwarfs project provides a benchmark suite consisting of different computation / communication idioms, i.e., dwarfs, for state-of-art multicore and GPU systems. The first instantiation of the OpenDwarfs has been realized in OpenCL.
- Use this benchmark for workload on both CPU and GPU

### Scrypt

* A memory hard hash function

### 
