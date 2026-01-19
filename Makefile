SHELL := /bin/bash

all: test

test: best fine fine-cpp awful with-fine-got with-awful-got
	time ./best
	time ./best-opt
	time ./fine
	time ./fine-opt
	time ./fine-cpp
	time ./fine-cpp-opt
	time ./with-fine-got
	time ./with-fine-got-opt
	time ./with-awful-got
	time ./with-awful-got-opt
	time ./awful
	time ./awful-opt

best: best.c
	cc best.c -o best
	cc best.c -O2 -march=native -o best-opt

fine: fine.c
	cc fine.c -o fine
	cc fine.c -O2 -march=native -o fine-opt

awful: awful.c
	cc awful.c -o awful
	cc awful.c -O2 -march=native -o awful-opt

with-fine-got: with_got.c
	cc fine_got/got.c with_got.c -DDYNAMIC_TABLE -o with-fine-got
	cc fine_got/got.c with_got.c -DDYNAMIC_TABLE -O2 -march=native -o with-fine-got-opt

with-awful-got: with_got.c
	cc awful_got/got.c with_got.c -DDYNAMIC_TABLE -o with-awful-got
	cc awful_got/got.c with_got.c -DDYNAMIC_TABLE -O2 -march=native -o with-awful-got-opt

fine-cpp: fine.cpp
	c++ fine.cpp -o fine-cpp
	c++ fine.cpp -O2 -march=native -o fine-cpp-opt

clean:
	rm best best-opt
	rm fine fine-opt
	rm fine-cpp fine-cpp-opt
	rm with-fine-got with-fine-got-opt
	rm with-awful-got with-awful-got-opt
	rm awful awful-opt
