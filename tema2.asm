.data
n: .space 4
m: .space 4
final: .space 4
str: .space 100
delim: .asciz " "
formatPrintf: .asciz "%d\n"
index: .long 0
aux: .long 0
aux2: .long 0
zero: .long 0
unu: .long 1
fixat: .space 400
frecv: .zero 400
patru: .long 4
v: .space 400
i: .long 0
j: .space 4
.text

valid:



pushl %ebp
movl %esp, %ebp
movl 8(%ebp), %eax


movl unu, %ecx
movl %ecx, i




movl %eax, %ecx
incl %ecx

movl %eax, %edx


v1:

cmp i, %eax
je v4

movl i, %ebx
incl %ebx
movl %ebx, j

movl %ebx, aux
movl m, %ebx
addl %ebx, aux
cmp aux, %ecx
cmovge aux, %ecx



	v2:
	cmp j, %ecx
	je v3
	
	movl j, %ebx
	movl (%edi, %ebx, 4), %edx
	movl i, %ebx
	movl (%edi, %ebx, 4), %ebx
	cmp %edx, %ebx
	je final0
	movl j, %ebx
	incl %ebx
	movl %ebx, j
	jmp v2
	
	v3:
	movl i, %ebx
	incl %ebx
	movl %ebx, i
	jmp v1




v4:



lea frecv, %esi
movl n, %ebx
incl %ebx
movl unu, %ecx
movl %ecx, i

v5:
cmp i, %ebx
je v6
movl i, %ecx
xorl %edx, %edx
movl %edx, (%esi, %ecx, 4)

movl i, %ecx
incl %ecx
movl %ecx, i
jmp v5

v6:



movl unu, %ecx
movl %ecx, i
movl %eax, %ebx
incl %ebx

v7:
cmp i, %ebx
je final1

movl i, %ecx
movl (%edi, %ecx, 4), %edx
movl (%esi, %edx, 4), %ecx
incl %ecx
movl %ecx, (%esi, %edx, 4)
cmp %ecx, patru
je final0

lea fixat, %esi

movl i, %ecx
movl (%esi, %ecx, 4), %edx
movl %edx, aux
movl (%edi, %ecx, 4), %edx
cmp aux, %edx
jne v8
jmp v9


v8:
movl aux, %edx
cmp %edx, zero
jne final0
jmp v9

v9:
movl i, %ecx
incl %ecx
movl %ecx, i
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
cmp i,  %ebx
je finalbacck


movl i, %edx
movl %edx, aux2
movl %edx, (%edi, %edx, 4)

pushl %edx
pushl $formatPrintf
call printf
popl %edx
popl %edx


pushl %eax
call valid
popl %edx

cmp %eax, unu
jne finalbacck
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

movl aux2, %ecx
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
jmp ff

ff2:
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

mov $1, %eax
xor %ebx, %ebx
int $0x80




