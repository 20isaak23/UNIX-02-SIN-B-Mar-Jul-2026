comados
gpg --list-secret-keys
Este comando es similar, como si abrieras un cajo de tu 
escritorio par saber cuantas llaves tienes, dice el nombre del
dueño el correo electronico y un codigo largo ID

gpg --armor --export-secret-keys
Nota: Si solo tiene un par de llaves este es suficiente 
--export-secret-keys: Se usa cuando quieres pasar tu llave 
a otra computadora 
--armor: 

gpg --list-keys
lista todas las llaves publicas