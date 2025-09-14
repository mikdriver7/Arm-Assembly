# ARM Assembly Cheat Sheet

## Data Directives
- `.byte`: Reserve 1 byte
- `.hword`: Reserve 2 bytes  
- `.word`: Reserve 4 bytes
- `.space`: Reserve uninitialized memory
- `.ascii`: ASCII string without null terminator

## Addressing Modes
- Immediate: `mov r0, #5`
- Register indirect: `ldr r1, [r0]`
- Immediate offset: `ldrb r2, [r1, #1]`
- Post-increment: `ldrb r2, [r1], #1`
- Pre-decrement: `ldrb r2, [r1, #-1]!`

## Branch Conditions
- beq: Branch if equal (Z=1)
- bne: Branch if not equal (Z=0)
- bgt: Branch if greater (signed)
- bge: Branch if greater or equal
- blt: Branch if less than
- ble: Branch if less or equal
