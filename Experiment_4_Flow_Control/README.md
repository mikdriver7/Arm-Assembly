# Experiment 4: Flow Control

## Overview
This experiment delves into program flow control in ARM assembly, focusing on conditional and unconditional branching instructions to create loops and make decisions. The core task was writing a program that processes a string by converting all lowercase letters to uppercase.

## Files
- **`ascii_conversion.s`**: The main program that converts a null-terminated string to uppercase.
- **`simple_loop.s`**: A basic program demonstrating loop construction to sum an array of numbers.

## Key Concepts Demonstrated

### 1. Branch Instructions
- **Unconditional Branch**: `b label` or `bal label` (Branch Always)
- **Conditional Branches**: Used to implement decision-making and loop control.
  - `beq` / `bne`: Branch if equal / not equal (check Zero flag)
  - `blt` / `bgt`: Branch if less than / greater than (signed comparisons)
  - `bhi` / `blo`: Branch if higher / lower (unsigned comparisons)

### 2. The Compare Instruction
- `cmp Rn, Operand2`: Subtracts Operand2 from Rn, sets the APSR flags (N, Z, C, V), but does not store the result.
- This is the primary instruction used before a conditional branch to check a condition.

### 3. Loop Construction
Loops are created by:
1. **Initialization**: Setting up a counter or pointer (e.g., `mov r3, #0`).
2. **Loop Body**: The code to execute each iteration (e.g., load a byte, check if lowercase).
3. **Condition Check**: Using `cmp` and a conditional branch to either continue the loop or exit (e.g., `beq stop`).
4. **Increment/Update**: Modifying the counter/pointer for the next iteration (e.g., `add r3, r3, #1`).

### 4. Character Conversion Logic
The algorithm for converting a character to uppercase:
1. Check if the character is the null terminator (`0`). If yes, exit the loop.
2. Check if the character is **less than** `'a'` (ASCII 97). If yes, skip conversion.
3. Check if the character is **greater than** `'z'` (ASCII 122). If yes, skip conversion.
4. If it passes both checks, it is a lowercase letter. Subtract 32 to convert it to uppercase.

## Code Highlights
- **String Termination**: The loop terminates by comparing each character to a null terminator (`0`) stored in a separate variable.
- **Efficient Comparison**: Uses a series of `cmp` and conditional branch instructions to check the ASCII range.
- **In-Place Modification**: The converted uppercase character is written back to the same memory location in the string.

## Results
The program successfully processed the string `"juMping JAck flaSh #1"` in memory, converting it to `"JUMPING JACK FLASH #1"`. The result was verified using the GDB debugger to examine the contents of the `message` memory location.

## Conclusion
Mastering flow control is crucial for writing non-trivial programs in assembly. This lab provided practical experience with loops, conditional execution, and character manipulation, forming the foundation for more complex algorithms like string processing, sorting, and input parsing.
