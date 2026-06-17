#! /bin/bash
awk '{print $1}' log.txt
awk '{print $2}' log.txt
awk '{print $3}' log.txt

#All
awk '{print $1,$2,$3}' log.txt

awk 'NR < 10' log.txt

grep "42.236.10.117" log.txt | awk '{print $7}'

sed 's/Mozilla/Godzilla/g' log.txt