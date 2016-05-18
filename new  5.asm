EXIT_SUCCESS = 0
SYSEXIT = 1
STDIN = 0
STDOUT = 1
SYSREAD = 3
SYSWRITE = 4

.bss

len: .space 16    # bufor na ilosc elemetow do wyswietlenia
small_len: .space 16  # bufor na ilosc elementow do porownania

buffor: .space 24000  # bufor przechowujacy dane wejsciowe
buffor_len = . - buffor  # dlugosc tego bufora


.text
.global _start

_start:

#read
        mov $SYSREAD, %eax   # wywolanie funkcji systemowej odczytu, wrzucenie eax
        mov $STDIN, %ebx     # wrzucenie strumienia wejsciowego do ebx
        mov $buffor, %ecx    # wrzucenie zawartosci buffora do ecx
        mov $buffor_len, %edx # wrzucenie dlugosci buffora do edx
        INT $0x80             # przerwanie

        mov %eax, len     # wrzuc eax do bufora do wyswietlenia elementow   
        shr $3, %eax  # dzielenie przez 8 przesunecie logiczne w prawo o 3 
        dec %eax   # Jesli porownuje 5 pakietow -> 1 z 2 porownuje 2 z 3 porownuje 3z 4 porownuje 4 z 5 i jest w sumie 4   ???
        mov %eax, small_len # wrzzuc  zawartosc eax do small_len- ilosc elementow do porownywania
        mov $0, %edx  # wyzeruj edx ??? bedziemy go uzywc pozniej w stosie i do pakietow ???

loop1:
        push %rdx      # wsadz na stos -> licznik 
        mov $0, %ecx    # wyzeruj ecx
        mov $buffor, %edi   # wrzucenie buffora do edi


loop2:
        push %rcx     # wrzuc na stos rcx
        mov $0, %esi  # wyzeruj esi
        mov (%edi, %esi, 4), %eax
        inc %esi
        mov (%edi, %esi, 4), %ebx
        inc %esi
        mov (%edi, %esi, 4), %ecx
        inc %esi
        mov (%edi, %esi, 4), %edx

        cmp %eax, %ecx
        ja go    # jezeli ecx jest wieksze od eax to idz do go
        jb remake  # jezeli ecx mniejsze od eax to remake;

        cmp %ebx, %edx  # jezeli edx wieksze od ebx to idz do go
        ja go

remake:
        xchg %ebx, %edx  # wymien zawartosc miedzy soba drugiej czesci liczba ( zeby posortowac rosnaco)
        xchg %eax, %ecx   # wymien zawartosc miedzy soba pierwszej czesci liczby

        mov $0, %esi     # wyzeruj esi
        mov %eax, (%edi, %esi, 4)  # wrzuc zawartosc eax- do edi odpowiednio dobierajac pozycje
        inc %esi
        mov %ebx, (%edi, %esi, 4)
        inc %esi
        mov %ecx, (%edi, %esi, 4)
        inc %esi
        mov %edx, (%edi, %esi, 4)

go:
        add $8, %edi  # dodaj 8 do edi bo trzeba porownac pakiet 1 i drugi potem drugi i 3
        pop %rcx     # wyrzuc zawartosc rcx ze stosu
        inc %ecx     # zwiekjsz ecx o 1
        cmp small_len, %ecx # jesli ecc mniejsze od small_len to skocz do loop2
        jl loop2

        pop %rdx
        inc %edx
        cmp small_len, %edx
        jl loop1

#write
        mov $SYSWRITE, %eax
        mov $STDOUT, %ebx
        mov $buffor, %ecx
        mov $len, %edx
        int $0x80

#exit
        movl $SYSEXIT, %eax
        movl $EXIT_SUCCESS, %ebx
        int $0x80