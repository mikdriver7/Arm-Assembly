@Mik Driver
@Mar 13, 2024

.syntax unified
.cpu cortex-m4
.thumb

.word 0x20000400
.word 0x800000ed
.space 0xe4

.data
array: .byte 3,2,4,1,5,6

@ 3 rows and 2 columns
@ array = 3 2
@         4 1
@         5 6

.text
start:
    @ address of 2d array = address of array + ( ((row i * num cols) + col j) * size of data)
    @array[2][1] to r8 (6)
    ldr r0, =array @load first address in array to r0
    mov r1,#2 @i
    mov r2,#1 @j
    mov r3, #2 @total number of columns
    mul r4,r1,r3 @i * num cols
    add r5,r2,r4 @(i * num cols) + j
    ldrb r8,[r0,r5] @address of array + ( ((i * cols) + j) * 1)

    @array[1][1] to r9 (1)
    mov r1,#1 @i
    mov r2,#1 @j
    mov r3, #2 @total number of columns
    mul r4,r1,r3 @i * num cols
    add r5,r2,r4 @(i * num cols) + j
    ldrb r9,[r0,r5] @address of array + ( (( i * cols) + j) * 1)

    @array[0][1] to r10 (2)
    mov r1,#0 @i
    mov r2,#1 @j
    mov r3, #2 @total number of columns
    mul r4,r1,r3 @i * num cols
    add r5,r2,r4 @(i * num cols) + j
    ldrb r10,[r0,r5] @address of array + ((( i * cols) + j) * 1)
stop: b stop
