# Setup Guide for ARM Development

## Required Tools
1. GNU ARM Toolchain
2. STM32CubeIDE or similar
3. STM32F334 Nucleo-64 Board
4. OpenOCD for debugging

## Compilation
```bash
arm-none-eabi-as -mcpu=cortex-m4 -g program.s -o program.o
arm-none-eabi-ld -T linker_script.ld program.o -o program.elf
