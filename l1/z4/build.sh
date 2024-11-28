cd z2 
gprbuild z4.gpr
cd ../build
cmake ..
make
cd ..
gcc -o main main.c z2/build/iterative.o z2/build/recursive.o -lgnat