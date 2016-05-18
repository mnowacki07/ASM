unsigned long long rdtsc(void);
 
#include <stdio.h>
 
int main(void)
{
    unsigned long long cc = rdtsc();
    printf("%llu",cc);
 
    return 0;
}
