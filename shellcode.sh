#!/bin/bash

#########################################################################
#  shellcode.sh is written by 0xCrypt00o                                #
#  take input as <filename.asm> and compile                             #
#  with nasm and link with ld                                           #
#  and then dump shellcode from it and output                           #
#  it and if you want to out file.c compained with shellcode            #
#  use ./shellcode.sh <filename.asm> c                                  #
#  example: ./shellcode.sh shell.asm                                    #
#  example to write it in c file : ./shellcode.sh shell.asm c           #
#########################################################################

echo "[+] ShellCoder Tool To Genrate shellcode with nasm and gnu ld "
echo "[+] Created And Developed By 0xCrypt00o 'Eslam Mohamed ' "



file=$(echo $1 | sed 's/.asm//g')

asmfile=$(echo $1 | grep $file.asm )

if [ -z $asmfile ]

then
echo "[-] Please call with assembly file"
else

if [ -e $1  ]
then

if [ -e $file.o ]
then
rm $file.o
fi
if [ -e $file ]
then
rm $file
fi
nasm -f elf32 $file.asm -o $file.o
if  [ -e $file.o ]
then
ld -m elf_i386 $file.o -o $file
else
echo "[-] error assembling "
exit
fi

if [ -e $file  ]
then
echo "[+] Successed "
echo "[+] ShellCode is : "
objdump -d $file.o | grep -Po '\s\K[a-f0-9]{2}(?=\s)' | sed 's/^/\\x/g' | perl -pe 's/\r?\n//' | sed 's/$/\n/' > $file.txt
shellcode=$(cat $file.txt)
#echo  $shellcode
nullbyte=$(echo $shellcode | grep --color='auto' '00')
if [ ! -z $nullbyte ]
then
printf "\n"
echo "[-] Warning Null Byte Was Found "
echo $shellcode | sed -s 's/00/00"here"/g'
else
printf "\n"
echo $shellcode
fi
if [ -z $2 ]
then
rm $file.txt
exit
else
yes=c
if [ $2 == $yes ]
then

printf "\n [+] Writing shellCode as %s.c ready for injection \n" $file

printf '

int main(){

char shellcode[]="%s";

int (*execshell)();
execshell=(int(*)()) shellcode;
int execrightnow=execshell();
}


' $shellcode  > $file.c
rm $file.txt
printf "\n\n\n[+] Compile C Program with : i686-linux-gnu-gcc -m32 -z execstack %s.c -o file\n " $file
exit
fi
fi
else
echo "[-] error linking "
exit
fi


else
echo "[-] File Not found "
fi


fi
