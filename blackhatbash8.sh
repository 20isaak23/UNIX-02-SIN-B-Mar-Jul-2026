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
sed '1d' log.txt
sed '$d' log.txt
sed '5,7d' log.txt
sed -n '2,15 p' log.txt
sed -i '1d' log.txt

sleep 100 & #Send to sleep for 100 seconds

ps -ef | grep sleep
#user 1827 1752 cons0 19:02:29 /usr/bin/sleep

jobs
#[1]+  Ejecutando                 sleep 100 &

fg %1
#Sleep 100
#For stop the fg we use crtl + z
#[1]+  Detenido                   sleep 100

bg %1
#[1]+ sleep 100 &
