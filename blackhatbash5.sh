#! /bin/bash
touch test && touch test123
(ls; ps)
ls; ps; whoami
lzl || echo "el comando lzl fallo"

ls -l / &> stdout_and_stderr.txt
cat stdout_and_stderr.txt

ls -l / 1> stout.txt 2> stderr.txt
lzl 2> error.txt
cat error.txt

