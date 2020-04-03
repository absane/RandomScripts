#!/bin/bash

for i in $(seq 1 10);
do
	electrum create -w $i | tee ${i}_info.txt
	clear
done

echo "50 Random Public Addresses"
echo "--------------------------"

cat * | grep -E "^[13][a-km-zA-HJ-NP-Z1-9]{25,34}$" | shuf -n100 | awk -v n=10 '1; NR % n == 0 {print ""}'
