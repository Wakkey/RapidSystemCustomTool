#!/bin/sh
DoExitAsm ()
{ echo "An error occurred while assembling $1"; exit 1; }
DoExitLink ()
{ echo "An error occurred while linking $1"; exit 1; }
echo Linking setconf
OFS=$IFS
IFS="
"
/usr/bin/ld.bfd -b elf32-i386 -m elf_i386  --dynamic-linker=/lib/ld-linux.so.2    -L. -o setconf link.res
if [ $? != 0 ]; then DoExitLink setconf; fi
IFS=$OFS
