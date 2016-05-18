.align 32


.data

buffor: .space 1500
data: .asciz "%s"


.text
.global main

main:
    pushl %ebp    # Odłożenie rejestru bazowego na stos i skopiwanie obecnej
    # wartości wskaźnika stosu do rejestru bazowego
    movl %esp, %ebp  

    push $buffor      #wrzuc argument funkcji bufor ( miejsce na char do wprowadzenia)
    push $data         # wrzuc jako argument char typ 
    call scanf			# wywolaj funkcje z c
    sub $8, %esp		# odejmij 8 od esp- wskaznik wierzcholka stosu bo bedzie wywolywane inna funkcja
    push $buffor         # wrzuc miejsce na chara
    push $data				# wrzuc dana typ char
    call printf            # wywolaj funkcje printf
    sub $8, %esp			# przywroc wskaznik stosu 
    mov $0, %eax			#

	 leave							# usuwa ramke stosu
   
 ret
