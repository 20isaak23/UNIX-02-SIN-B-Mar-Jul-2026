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

#groupadd [opciones] nombre_grupo 
#Create a simple group
sudo groupadd desarrolladores 
sudo groupadd -g 2000 operaciones #GID específico 
#system of group (GID < 1000)
sudo groupadd --system servicios_web
#Verify the creation of group   
rep "desarrolladores\|operaciones\|servicios_web" /etc/group
#Look principals options
groupadd --help
#View the range of GIDs in the system
grep "GID_MIN\|GID_MAX\|SYS_GID" /etc/login.defs
#System groups have a GID lower than the minimum user
#In ubuntu is typical
#SYS_GID_MIN = 100
#SYS_GID_MAX = 999
#GID_MIN = 1000
#GID_MAX = 60000

#Create groups with addgroupa
addgroup diseno
addgroup --gid 2100 marketing
addgroup --system cache_web

#Verify
grep "diseno\|marketing\|cache_web" /etc/group

# Remember that grep is aa filter 
groups
id

# Agred user to group with usermod (low level)
usermod -aG desarrolladores $USER 
usermod .aG diseno $USER
#Here there is a problem, if we write this command an error will appear, so we change $USER
#for root
usermod -a -G desarrolladores root
usermod -aG diseno root

#verify 
id root 