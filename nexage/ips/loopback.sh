#!/bin/bash

for ((i=2;i<21;i++))
do
	sudo ifconfig lo:$(($i-2)) 127.0.0.$i
done
	
