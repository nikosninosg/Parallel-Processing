#!/bin/bash

for i in ./src/*.cpp 
do
	a=$(echo $i | sed 's/.cpp$//')
	g++ -O0 -fopenmp -Wall -Wextra -o "$a"_O0 $i
	mv "$a"_O0 ./bin 
	g++ -O3 -fopenmp -Wall -Wextra -o "$a"_O3 $i
	mv "$a"_O3 ./bin 
done
