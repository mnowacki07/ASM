int get_control();
int get_status();

#include <stdio.h>



int main(void)
{
float a=0;
float b=0;
float d=1; 
float e=10;

 





int stat=get_status();
printf("\nstatus\n");
printf("%d",stat);
printf("\ncontrol\n");

int contr=get_control();
printf("%d",contr);

float c=d/a; 


int stat1=get_status();
printf("\nstatus\n");
printf("%d",stat1);
printf("\ncontrol\n");

int contr1=get_control();
printf("%d",contr1);


c=d/e ; 



int stat2=get_status();
printf("\nstatus\n");
printf("%d",stat2);
printf("\ncontrol\n");

int contr2=get_control();
printf("%d",contr2);



    return 0;
}
               
