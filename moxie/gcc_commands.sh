for f in *.c;do           gcc -fno-asynchronous-unwind-tables -m32 -S "$f";done
for f in *.c;do moxie-elf-gcc -fno-asynchronous-unwind-tables -o "${f%.c}_moxie.s" -S "$f";done

