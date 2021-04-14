nasm -felf64 -o x.o $1
gcc -no-pie -fno-pie x.o
./a.out
rm ./a.out
rm ./x.o