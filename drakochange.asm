.bss
.comm control, 2

.data


parzysta: .long 0xF3FF         

ciecie: .long 0x0C00            


.text
.global set_fpu
.type set_fpu, @function



set_fpu:
        pushq %rbp
        movq %rsp, %rbp         

        fnstcw control          

     
    
               

        
                cmp $1, %rdi    
                je parzy      
                jl END          
                jg ciec   

      

        parzy:
                
                movw control, %ax
                movw parzysta, %cx    
                andw %cx, %ax           
                movw %ax, control

                fldcw control
                jmp END

  

        ciec:
                
                movw control, %ax
                movw ciecie, %cx       
                orw %cx, %ax            
                movw %ax, control

                fldcw control  
                jmp END

        END:
                popq %rbp
                ret
