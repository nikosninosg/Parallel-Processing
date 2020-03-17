#!/bin/bash

colors=("\e[31m" "\e[32m" "\e[33m" "\e[34m" "\e[35m")
k=0
alt=0

for j in 1 2 4
do
	export OMP_NUM_THREADS=$j
	k=0
for i in ./bin/*
do
	echo -e "${colors[$k]}running $i with $j threads"
	./$i polylines_large.txt $1 0
	echo -e "\e[97m----------------------------------------------------"
	if [ $alt -eq 1 ]
	then
		k=$k+1
		alt=0
	else
		alt=1
	fi
done
echo -e  "\e[97m________________________________________________________"
echo -e  "\e[97m________________________________________________________"
done 
