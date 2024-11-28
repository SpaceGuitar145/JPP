cd z1
gcc -c iterative.c
gcc -c recursive.c
cd ..
gprbuild z5.gpr -largs z1/iterative.o z1/recursive.o 