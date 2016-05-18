.align 32


.data

buffor: .space 1500
data: .asciz "%d"


.text
.global main

main:
   # Odłożenie rejestru bazowego na stos i skopiwanie obecnej
    # wartości wskaźnika stosu do rejestru bazowego
     pushl %ebp
    movl %esp, %ebp
    push $buffor
    push $data
    call scanf
    sub $8, %esp
    push buffor
    push $data
    call printf
    sub $8, %esp
    mov $0, %eax
   

 leave
 ret
