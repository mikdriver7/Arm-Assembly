@Mik Driver
@Feb. 21, 2024

.syntax unified
.cpu cortex-m4
.thumb

.word 0x20000400
.word 0x800000ed
.space 0xe4

.data
mick: .byte 2,3,4 @ declare 3 bytes of data starting at address mick
keith: .byte 5,6,7 @ declare 3 bytes of data starting at address keith
dot: .space 0x01 @ reserve 1 byte of RAM without initialization

.text
start:
    ldr r0,=mick
    ldrb r1,[r0]
    ldr r0,=mick+1
    ldrb r2,[r0]
    ldr r0,=mick+2
    ldrb r3,[r0]
    ldr r0,=keith
    ldrb r4,[r0]
    ldr r0,=keith+1
    ldrb r5,[r0]
    ldr r0,=keith+2
    ldrb r6,[r0]
    mul r1, r1, r4
    mul r2, r2, r5
    mul r3, r3, r6
    add r7, r1, r2
    add r8, r7, r3
    ldr r0,=dot
    strb r8,[r0]
stop: b stop
