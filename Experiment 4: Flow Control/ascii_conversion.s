@ Mik Driver
@ Mar. 27th, 2024

.syntax unified
.cpu cortex-m4
.thumb

.word 0x20000400
.word 0x800000ed
.space 0xe4

.data
message: .ascii "juMping JAck flaSh #1"
lastchar: .byte 0

.text
start: 
    ldr r0,=message
    ldr r1, =lastchar
    ldrb r2,[r1]
    mov r3,#0 @int i = 0
    mov r4,#32
    mov r5,#97 @a
    mov r6,#122 @z

loop: 
    ldrb r7,[r0,r3]
    cmp r2,r7
    beq stop
    cmp r7,r5
    blt next
    cmp r7,r6
    bgt next
    sub r7,r7,r4
    strb r7,[r0,r3]
next: 
    add r3,r3,#1
    bal loop
stop: b stop
