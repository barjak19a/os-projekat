.extern _ZN5riscv20handleSupervisorTrapEv


.align 4
.global _ZN5riscv14supervisorTrapEv
.type _ZN5riscv14supervisorTrapEv, @function
_ZN5riscv14supervisorTrapEv:
    addi sp, sp, -256
    # x0 ozicen na nulu
    # x1 cuvamo u  okviru same strukture konteksta
    # x2 cuvamo u okvritu same strukture konteksta
    .irp index 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index *8(sp)
    .endr

        call _ZN5riscv20handleSupervisorTrapEv

    sd a0, 10*8(sp)

    # x0 ozicen na nulu
    # x1 cuvamo u  okviru same strukture konteksta
    # x2 cuvamo u okvritu same strukture konteksta
    .irp index 0,1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index *8(sp)
    .endr
    addi sp, sp, 256


    sret