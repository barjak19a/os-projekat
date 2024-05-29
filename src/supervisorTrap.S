.extern _ZN5riscv20handleSupervisorTrapEv

.align 4
.global _ZN5riscv14supervisorTrapEv
.type _ZN5riscv14supervisorTrapEv, @function
_ZN5riscv14supervisorTrapEv:
    addi sp, sp, -256
    .irp index 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index *8(sp)
    .endr

    csrr t0, sepc
    sd t0, (sp)

    call _ZN5riscv20handleSupervisorTrapEv

    csrr t1, sepc
    ld t0, (sp)
    beq t0, t1, restore # if sepc has not been modified, it was a trap - restore ALL registers

    .irp index 0,1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index *8(sp)
    .endr
    addi sp, sp, 256
    sret

restore:
    .irp index 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index *8(sp)
    .endr
    addi sp, sp, 256
    sret