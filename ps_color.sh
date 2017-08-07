#!/bin/bash
clear

for (( i=30; i<40; i++ ))
do
printf '\t%d' " $i"
done
echo ""

for (( j=0;j<10; j++ ))
do
printf '%d\t' $j
for (( i=30; i<40; i++ ))
do
printf '\e['$j';'$i'm%-6s\e[m\t' " Test"
done
echo ""
done

for (( i=40; i<50; i++ ))
do
printf '\t'$i
done
echo ""

for (( j=0;j<10; j++ ))
do
printf $j'\t'
for (( i=40; i<50; i++ ))
do
printf '\e['$j';'$i'm%-6s\e[m\t' " Test"
done
echo ""
done


echo
echo "Example in C"
echo "printf('\033[07;34mHello, World!\033[0m');"
