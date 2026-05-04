#Comandos 
#Display your user ID number and the groups you belong to in the system
id
#Read the system user file and display only the first 10 lines.
cat /etc/passwd | head -10

#Crackear: Hace una accion irreversible (lo hace a la fuera) y lo hace por medio de los hash 

#¿ALmacena contraseñas en linux? -> No, almacena las hash de las contraseñas

#¿Que es salt?
#Es una cadena aleatoria que se genera cuando creas o cambias una contraseña 

#Rainbow Tables
#Tablas precomputadas de millones de pares (contraseña -> hash) sin salt