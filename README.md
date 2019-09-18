

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
