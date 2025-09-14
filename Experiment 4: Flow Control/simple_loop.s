@ Simple Loop Example
@ Sums an array of 5 numbers

.syntax unified
.cpu cortex-m4
.thumb

.word 0x20000400
.word 0x800000ed
.space 0xe4

.data
num: .byte 1,2,3,4,5
sum: .space 0x01

.text
start:
    mov r0, #0          @ Initialize sum (r0) to 0
    ldr r1, =num        @ Load base address of array into r1
    mov r2, #5          @ Initialize loop counter (r2) to 5 (number of elements)

top:
    ldrb r3, [r1]       @ Load byte from memory address in r1 into r3
    add r0, r0, r3      @ Add the loaded value to the running sum (r0)
    add r1, r1, #1      @ Increment the memory pointer to next element
    subs r2, r2, #1     @ Decrement loop counter and set flags
    bne top             @ Branch back to 'top' if counter != 0 (Z flag not set)

    ldr r1, =sum        @ Load the address of the result variable
    strb r0, [r1]       @ Store the final sum (byte in r0) to memory

stop: b stop
