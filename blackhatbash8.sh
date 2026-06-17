#! /bin/bash
awk '{print $1}' log.txt
awk '{print $2}' log.txt
awk '{print $3}' log.txt

#Print All
awk '{print $1,$2,$3}' log.txt

awk 'NR < 10' log.txt

grep "42.236.10.117" log.txt | awk '{print $7}'

# Replaces all occurrences of "Mozilla" with "Godzilla" in log.txt and prints the result to the terminal without modifying the original file.
sed 's/Mozilla/Godzilla/g' log.txt

#Replaces all occurrences of "Mozilla" with "Godzilla" in log.txt and saves the output to a new file called newlog.txt.
sed 's/Mozilla/Godzilla/g' log.txt > newlog.txt

sed 's/ //g' log.txt