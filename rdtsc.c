unsigned long long rdtsc(void);
 
#include <stdio.h>
 
int main(void)
{
   
int zmienna; 
unsigned long long czas1=0; 
unsigned long long czas2=0; 
unsigned long long final=0; 
unsigned long long czas11=0;
unsigned long long czas22=0;
unsigned long long final2=0;
float a= 13.5; 
float b= 122.5; 
float c=44.5; 
float d=0; 
float e=0; 
float f=0; 
float g=0; 
float h=0; 
float i=0;
scanf("%d", &zmienna);
switch( zmienna )
{
case 1:
czas1=rdtsc(); 

int i=0;
for( i=0 ; i<8000 ; i++){
d=a+b; 
e=c*d; 
f=c+d; 
g=d*d; 
h=a+d; 
i=b*b; 
}    
   czas2=rdtsc();
final=czas2-czas1; 
 printf("%llu",final);


 break;
   
case 2:
  czas11=rdtsc(); 
int j=0;
for( j=0 ; j<8000 ; j++){
d=a+b; 
e=c*d; 
f=e+d; 
g=d*d; 
h=a+g; 
i=h*h; 
}
   czas22=rdtsc();
final2=czas22-czas11;
 printf("%llu",final2);

    break;

 
    return 0;
} 

}
