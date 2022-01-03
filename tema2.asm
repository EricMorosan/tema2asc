.data
n: .space 4
m: .space 4
final: .space 4
str: .space 100
delim: .asciz " "
formatPrintf: .asciz "%d "
formatPrintf2: .asciz "\n"
index: .long 1
aux: .long 0
aux2: .long 0
aux3: .long 0
aux4: .long 0
aux5: .long 0
pula: .long 0
pula2: .long 0
pula3: .long 0
pula4: .long 0
zero: .long 0
unu: .long 1
fixat: .space 400
frecv: .zero 400
patru: .long 4
v: .space 800
i: .long 0
j: .space 4
k: .space 4
l: .space 4
.text

valid:



pushl %ebp
movl %esp, %ebp
movl 8(%ebp), %eax
movl %eax, aux5


movl unu, %ecx
movl %ecx, k




movl %eax, %ecx
incl %ecx
movl %ecx, aux4

movl %eax, %edx




v1:


cmp k, %eax
je v4
movl aux4, %ecx

movl k, %ebx
incl %ebx
movl %ebx, l

movl %ebx, aux3
movl m, %ebx
addl %ebx, aux3
cmp aux3, %ecx
cmovge aux3, %ecx





	v2:

	
	cmp l, %ecx
	je v3
	
	
	movl l, %ebx
	movl (%edi, %ebx, 4), %edx
	movl k, %ebx
	movl (%edi, %ebx, 4), %ebx
	
	cmp %edx, %ebx
	je final0
	movl l, %ebx
	incl %ebx
	movl %ebx, l
	jmp v2
	
	v3:
	movl k, %ebx
	incl %ebx
	movl %ebx, k
	jmp v1




v4:




lea frecv, %esi
movl n, %ebx
incl %ebx
movl unu, %ecx
movl %ecx, k

v5:
cmp k, %ebx
je v6
movl k, %ecx
xorl %edx, %edx
movl %edx, (%esi, %ecx, 4)

movl k, %ecx
incl %ecx
movl %ecx, k
jmp v5

v6:



movl unu, %ecx
movl %ecx, k
movl aux5, %ebx
incl %ebx

v7:
cmp k, %ebx
je final1

movl k, %ecx
lea frecv, %esi

movl (%edi, %ecx, 4), %edx
movl (%esi, %edx, 4), %ecx
incl %ecx
movl %ecx, (%esi, %edx, 4)
cmp %ecx, patru
je final0

lea fixat, %esi

movl k, %ecx
movl (%esi, %ecx, 4), %edx
movl %edx, aux3
movl (%edi, %ecx, 4), %edx
cmp aux3, %edx
jne v8
jmp v9


v8:
movl aux3, %edx
cmp %edx, zero
jne final0
jmp v9

v9:
movl k, %ecx
incl %ecx
movl %ecx, k
jmp v7





final0:
mov $0, %eax
jmp finalvalid

final1:
mov $1, %eax
jmp finalvalid

finalvalid:
popl %ebp
ret



bacck:



pushl %ebp
movl %esp, %ebp
movl 8(%ebp), %eax
movl %eax, aux




movl unu, %ecx
movl %ecx, i
movl n, %ebx
incl %ebx



b1:
movl n, %ebx
incl %ebx
cmp i,  %ebx
je finalbacck


movl i, %edx
movl %edx, aux2
movl aux, %eax
movl %edx, (%edi, %eax, 4)





pushl %eax
call valid
popl %edx



cmp %eax, unu
je b30

movl aux2, %ecx
incl %ecx
movl %ecx, i
jmp b1


b30:
movl aux, %eax
movl n, %ecx
addl n, %ecx
addl n, %ecx

cmp %ecx, %eax
je finalfinal

movl aux, %eax
incl %eax

pushl %eax
call bacck
popl %edx
movl aux, %eax
decl %eax
movl %eax, aux

movl (%edi,%eax,4), %ecx
incl %ecx
movl %ecx, i
jmp b1


finalbacck:
popl %ebp
ret

finalfinal:

movl unu, %ecx
movl %ecx, j
movl aux, %edx
incl %edx

ff:
movl aux, %edx
incl %edx

cmp j, %edx
je ff2
movl j, %ecx
movl (%edi, %ecx, 4), %eax

pushl %eax
pushl $formatPrintf
call printf
popl %ebx
popl %ebx

movl j, %ecx
incl %ecx
movl %ecx, j
jmp ff

ff2:
pushl %eax
pushl $formatPrintf2
call printf
popl %ebx
popl %ebx

popl %ebp

mov $1, %eax
xor %ebx, %ebx
int $0x80


.global main
main:

pushl $str
call gets
popl %ebx

lea fixat, %esi
lea v, %edi

pushl $delim
pushl $str
call strtok
popl %ebx
popl %ebx


pushl %eax
call atoi
popl %ebx


movl %eax, n

pushl $delim
pushl $0
call strtok
popl %ebx
popl %ebx

pushl %eax
call atoi
popl %ebx

movl %eax, m

movl n, %eax
addl n, %eax
addl n, %eax
incl %eax
movl %eax, final

citire:
movl index, %ecx
cmp %ecx, final
je et1

pushl $delim
pushl $0
call strtok
popl %ebx
popl %ebx

pushl %eax
call atoi
popl %ebx 

movl index, %ecx
movl %eax,(%esi,%ecx,4)
incl %ecx
movl %ecx, index



jmp citire

et1:

movl unu, %ecx
pushl %ecx
call bacck
popl %ecx

xorl %ecx, %ecx
decl %ecx



pushl %ecx
pushl $formatPrintf
call printf
popl %ebx
popl %ebx

pushl %eax
pushl $formatPrintf2
call printf
popl %ebx
popl %ebx

mov $1, %eax
xor %ebx, %ebx
int $0x80
