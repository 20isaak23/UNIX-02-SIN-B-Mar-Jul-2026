import crypt
password = "micontraseña123"
salt1 = crypt.mksalt(crypt.METHOD_SHA512)
salt2 = crypt.mksalt(crypt.METHOD_SHA512)
hash1 = crypt.crypt(password, salt1)
hash2 = crypt.crypt(password, salt2)
print("Salt 1:" , salt1)
print("Hash 1" , hash1[:50])
print()
print("Salt 2:" , salt2)
print("Hash 2:" , hash2[:50])
print()
print("¿Son inguales?" , hash1 == hash2)

#Ver todos los grupos del sistema 
cat /etc/group | head -10

#¿A que grupos pertenece el usuario actual?
groups 
groups $USER

#Ver el UID y GID of user actual
id -u #User ID
id -g #Groups ID principal 
id -G #todos los Group IDs
