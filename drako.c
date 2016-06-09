int get_status();
int get_control();
void set_fpu(int round);
#include <stdio.h> 



int main(void)
{




int control=get_control();
printf("%d",control);
printf("\n\n");

//0 taki sam tryb 1 do najblizszej parzystej wieksze od 1 to obciecie
int wyb=0; 

scanf("%d",&wyb);

set_fpu(wyb); 

int contr=get_control();
printf("%d",contr);






    return 0;
}
