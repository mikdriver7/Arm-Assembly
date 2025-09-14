# Experiment 3: Addressing Modes and 2-D Arrays

## Overview
This experiment explores the various addressing modes available in the ARM Thumb instruction set and applies them to efficiently access elements within a two-dimensional array stored in memory.

## Files
- **`2darray.s`**: The main program that calculates and accesses specific elements of a 3x2 integer array using addressing modes.
- **`endian_test.s`**: A supplementary program demonstrating little-endian memory storage on the STM32 platform.

## Key Concepts Demonstrated

### 1. Addressing Modes
- **Register Indirect with Immediate Offset**: `ldrb r8, [r0, r5]`
  - Accesses memory at the address calculated by `(base register + offset register)` without modifying either register.
  - Used to calculate the address of an element in the 2D array.

### 2. 2D Array Index Calculation
The program calculates the memory address of an element in a row-major order 2D array using the formula:
`element_address = base_address + ((row_index * num_columns) + column_index) * size_of_element`

### 3. Endianness
The experiment confirms the STM32F334's little-endian architecture, where the least significant byte of a word is stored at the lowest memory address.

## Code Highlights
- **Array Declaration**: A 3x2 array is statically initialized in the `.data` section.
- **Element Access**: The program accesses three different elements (`[2][1]`, `[1][1]`, `[0][1]`) and loads them into registers R8, R9, and R10 respectively.
- **Efficient Calculation**: Uses `mul` and `add` instructions to compute the linear offset before using it in a load instruction.

## Results
The program successfully demonstrated:
- The calculated address for `array[2][1]` (value `6`) was loaded into R8.
- The calculated address for `array[1][1]` (value `1`) was loaded into R9.
- The calculated address for `array[0][1]` (value `2`) was loaded into R10.
- The use of register indirect addressing with offset for efficient array traversal.

## Conclusion
This lab solidified the practical application of ARM addressing modes, moving beyond simple variables to structured data. Understanding how to calculate memory offsets is fundamental to working with arrays, matrices, and more complex data structures in assembly language.
