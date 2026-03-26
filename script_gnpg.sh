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
gpg --local-user 7F946AAB2BE9B927 --clearsign doc_no_cifrado.txt
gpg --local-user 7F946AAB2BE9B927 --sign doc_no_cifrado.txt
gpg --local-user 7F946AAB2BE9B927 --detach-sign doc_no_cifrado.txt

gpg --verify firma_henry.asc
gpg --verify firma_henry.gpg
gpg --verify firma_henry.sig doc_cifrado.txt
gpg --edit-key chineado12@gmail.com
gpg --local-user 7F946AAB2BE9B927 --sign-key 82B292987F6AD054B6435BD4B0E4743042965E13
#Here I used mi key ID for sign and used the ID of my companion 
gpg --decrypt mensaje_seguro.gpg > resultado_final.txt
#Decryp comand of henry 
cat resultado_final.txt
#Show the message of henry 