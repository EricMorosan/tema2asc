.data
n: .space 4
m: .space 4
final: .space 4
str: .space 100
delim: .asciz " "
formatPrintf: .asciz "%d\n"
index: .long 0
aux: .long 0
zero: .long 0
unu: .long 1
fixat: .space 400
frecv: .zero 400
v: .space 400
i: .long 0
j:. space 4
.text

valid:

pushl %ebp
movl %esp, %ebp
movl 8(%ebp), %eax

movl zero, %ecx
movl %ecx, i
movl unu, %ecx
movl %ecx, j

movl %eax, %ecx
incl %ecx



v1:
cmp i, %eax
je v3
movl i, %ebx
incl %ebx
movl %ebx, j
movl %ebx, aux
movl m, %ebx
addl %ebx, aux
cmp aux, %ecx
cmovle aux, %ecx

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
v3:



final0:
mov $0, %eax


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

pushl %eax
pushl $formatPrintf
call printf
popl %ebx
popl %ebx

jmp citire

et1:



mov $1, %eax
xor %ebx, %ebx
int $0x80




