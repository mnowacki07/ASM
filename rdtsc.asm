
.global rdtsc
.type rdtsc,@function
rdtsc:
    xorl %eax,%eax    
    cpuid		
    rdtsc              
         
         shlq $32, %rdx
	 addq %rdx, %rax	

 ret  
