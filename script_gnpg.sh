# comados ejecutados 
gpg --version 
gpg --full-generate-key
gpg --list-secret-keys --keyid-format=long

gpg --armor --export 7F946AAB2BE9B927 > mi_llave_publica.asc
gpg --import llave_publica_henry.asc 
gpg --list-keys 
echo (" Mensaje secreto") > doc_no_cifrado.txt 
gpg --encrypt --recipient chineado12@gmail.com doc_no_cifrado.txt
gpg --decrypt "doc_cifrado (1).txt"
