    #History
    1  cd nebula
    2  ls
    3  ls -l
    4  mkdir registros
    5  mv registros bitacoras
    6  mkdir borradores
    7  git add .
    8  git commit -m "Fix problema 1: estructura de directorios corregida"
    9  git status
   10  mv cosmos.txt bitacoras
   11  mv estrella.bak estrella.conf
    1  history
    2  cat ~/.bash_history
    3  ls -l galaxia.sh
    4  ls galaxia.sh
    5  chmod u+s galaxia.sh
    6  pwd
    7  cd nebula
    8  chmod u+s galaxia.sh
    9  ls -l
   10  mkdir -p /tmp/nebula_zone
   11  chmod +t /tmp/nebula_zone
   12  ls -ld /tmp/nebula_zone
   13  chmod o+x /tmp/nebula_zone
   14  ls -ld /tmp/nebula_zone
   15  gpg --full-generate-key
   16  gpg --list-keys
   17  gpg --encrypt --recipient aurora@nebula.lab bitacoras/cosmos.txt
   18  gpg --clearsign estrella.conf
   19  gpg --verify galaxia.sh.sig galaxia.sh
   20  gpg --detach-sign galaxia.sh
   21  gpg --verify galaxia.sh.sig galaxia.sh
   22  history
