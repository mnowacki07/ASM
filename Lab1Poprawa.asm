.align 32


STDOUT 		= 1
STDIN 		= 0
SUCCESS		= 0
SYSEXIT 	= 1
SYSWRITE 	= 4 
SYSREAD         = 3


.data
const: .ascii "000 "		
constlen = . - const

.bss 

.comm sout, 4 
.comm sin, 1			
			 

.text
.global _start
_start:
	MOV $sin, %ecx		
	MOV $1, %edx #dlugosc wczytanego znaku 1 bajt
	 MOV $SYSREAD, %eax # wywolanie funkcji odczytujacej
        MOV $STDIN, %ebx # to co weszlo na strumien wejsciowy do ebx
        INT $0x80   # funkcja przerwania


	CMP $0, %eax	# porownanie z 0 rejestru eax- > sprawddzenie czy nie jest puste jezeli tak to iddz do wyjscia	
	JE out

	MOV const, %eax	 # wrzucenie szablonu do eax	
	MOV %eax, sout    # wrzucenie eax na strumien wyjsciowy
	MOV $0, %eax      # wyzerowanie eax
	MOVB sin, %al     # przenies bajtowo do al zawartosc struumienia wejsciowego
 	MOV $3, %esi		# wloz 3 do esi
	MOV $10 , %bl     # wartosc 10 do bl
	
	

	loop: 

	DEC %esi       # zmiejsz esi
	DIV %bl 		# podziel rejestr al przez bl reszta w ah 
	ADDB %ah, sout(%esi)   # reszta z dzielenia- wrzuceniejej na strumien wyjsciowy esi sluzy nam do przesuwania liczb w szablonie (poprzez ddzielenie przez 10 otrzymane reszty tworza dec obraz ascii) 
	MOV $0, %ah   # wyzeruj rejestr z reszta
	cmp $0 , %esi  # porownaj zawartosc esi z 0 jezeli nie sa rowne kontynuuj petle jezeli sa idz dalej
	JNE loop		              
	
 
        	
		                      
	


	MOV $sout, %ecx		  # strumien wyjscioy wrzucamy do ecx
	MOV $4, %edx           # dlugosc bufora ( szablonu z obrazem dzisietnym)-4 wrzucone do edx 
	 MOV $SYSWRITE, %eax	# wywolanie funkcji systemowej zapisu wrzucenie do eax
        MOV $STDOUT, %ebx	# funkcja systemowa standarowej wyjscie do ebx
        INT $0x80            # wywolanie przerwania


	JMP _start # skok na poczatek procedur. wykonanie dla kolejnych znakow



	out:
	MOV $SYSEXIT, %eax  # wywolanie funkcji systemowej w eax
	MOV $SUCCESS, %ebx  # z sukcesem 
	INT $0x80
