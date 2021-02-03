

# jmBenchmark

## Some useful tools

- x86_energy_perf_policy

  - Help to enable and setting hwp and turbo
  - Need sudo

- CoreFreq

  - Help check hardware function support or not, enable or not

- PowerTop

  - Energy status tracking like top

- perf

  - Display energy status with Linux sysfs
  - ```bash
    perf stat -e power/energy-pkg/,power/energy-cores/,cycle -I 1000 sleep 1000
    ```

* cpuid
  * Dump detailed information about the CPU(s) gathered from the CPUID instruction,
    and also determine the exact model of CPU(s).

Some useful commands

* Check CPU idle informations

  * ```bash
    ls /sys/devices/system/cpu/cpu*/cpuidle/
    ```

* Check ACPI table informations

  * ```bash
    cat /sys/firmware/acpi/table/DSDT > dsdt
    iasl -d dsdt
    ```

  * Check dsdt.dsl



### Useful MSRs

| Register Address | Register Name               | Bit Description                                              |
| ---------------- | --------------------------- | ------------------------------------------------------------ |
|                  |                             |                                                              |
|                  |                             |                                                              |
| 610H             | MSR_PKG_POWER_LIMIT         | PKG RAPL Power Limit Control (R/W)                           |
| 614H             | MSR_PKG_POWER_INFO          | PKG RAPL Parameters (R/W)                                    |
| 638H             | MSR_PP0_POWER_LIMIT         | PP0 RAPL Power Limit Control (R/W)                           |
| 639H             | MSR_PP0_ENERGY_STATUS       | PP0 Energy Status (R/O)                                      |
| 63AH             | MSR_PP0_POLICY              | PP0 Balance Policy (R/W)                                     |
| 640H             | MSR_PP1_POWER_LIMIT         | PP1 RAPL Power Limit Control (R/W)                           |
| 641H             | MSR_PP1_ENERGY_STATUS       | PP1 Energy Status (R/O)                                      |
| 642H             | MSR_PP1_POLICY              | PP1 Balance Policy (R/W)                                     |
| 648H             | MSR_CONFIG_TDP_NOMINAL      | TDP base                                                     |
| 649H             | MSR_CONFIG_TDP_LEVEL1       | TDP down level                                               |
| 64AH             | MSR_CONFIG_TDP_LEVEL2       | TDP up level                                                 |
| 64BH             | MSR_CONFIG_TDP_CONTROL      | Select Base, up or down TDP                                  |
| 64CH             | MSR_TURBO_ACTIVATION_RATIO  | Setting max none turbo ratio (RW/L)                          |
| 64DH             | MSR_PLATFORM_ENERGY_COUNTER | Total energy consumed by all devices in the platform that receive power from integrated power delivery mechanism, included platform devices are processor cores, SOC, memory, add-on or peripheral devices that get powered directly from the platform power delivery means. Only in Skylake and later |
|                  |                             |                                                              |



### Useful MCHBARs

| Offset                  | Name    | Description                         |
| ----------------------- | ------- | ----------------------------------- |
|                         |         |                                     |
|                         |         |                                     |
| [B:0, D:0, F:0] + 5978h | Package | Package temperature in degrees (C)  |
| [B:0, D:0, F:0] + 597Ch | PP0     | PP0 (IA) temperature in degrees (C) |
| [B:0, D:0, F:0] + 5980h | PP1     | PP1 (GT) temperature in degrees (C) |
|                         |         |                                     |

- Reading MCHBARs command

  ```bash
  sudo inteltool -m | grep -P '5978|597c|5980'
  ```

  

## Prerequisites

```bash
sudo apt install libpapi-dev
```

- For OpenCL benchmarks OpenDwarfs, need Intel OpenCL runtime for GPU/CPU

## likwid-scripts

- likwid-perfscope-ty, likwid-perfscope-xy

  ​	likwid-perfscope is a modify version of the one in likwid. The major update is add sudo execute on remote host. You need double type your sudo password of your remote host and the second type will not print any message since stdout is redirected.

- likwid-perf need msr read & write

  ```bash
  sudo modprobe msr
  ```
  

### Known Issue

* Sometime drawing may lag when HT is enabled

  

## Micro-Benchmark

### OpenDwarfs

- The OpenDwarfs project provides a benchmark suite consisting of different computation / communication idioms, i.e., dwarfs, for state-of-art multicore and GPU systems. The first instantiation of the OpenDwarfs has been realized in OpenCL.
- Use this benchmark for workload on both CPU and GPU

### Scrypt

* A memory hard hash function


