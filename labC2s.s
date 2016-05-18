
.global rdtsc
.type rdtsc,@function
rdtsc:						# funkcja ktor mierzy ilosc cykli wykonanych przez procesor
    xorl %eax,%eax    # wyzeruj rejestr eax
    cpuid				# funkcja serialzujaca. gwarantuje ze wszystkie instrukcje zostane wykonane
    rdtsc              
    ret   # powrot
