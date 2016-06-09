.bss
.comm control, 2
.comm status, 2

.text
.global get_control, get_status
.type get_control, @function
.type get_status, @function
get_control:
        fstcw control

        
        movw control, %ax
        ret

get_status:

     
       fstsw status
       

        movw status, %ax
ret
