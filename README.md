boot 
El sistema que vamos a construit tienen tres componentes:

1. **Kernel Linux** - el núcleo del sistema operativo 
2. **BusyBox** - proporciona las utilidades basicas de Unix (ls, pwd, vi, etc.) en un solo binario 
3. **Syslinux** - el bootloader que carga todo al arrancar 

sudo apt update 
sudo apt upgrade 
sudo apt install -y git vim make gcc libncurses-dev flex bison bc cpio libelf-dev libssl-dev syslinux dosfstools qemu-system-x86

**¿Para qué sirve cada paquete?**
- gcc, make - compilation of kernel and BusyBox
- libncurses-dev - menús intercativos de configuracion (menuconfig)
- flex, bison, bc - requeridos por el proceso del build del kernel 
- cpio - para crear el initramfs
- libelf-dev , libssl-dev - dependencias del kernel 
- syslinux - el bootloader 
- dosfstools - para crear el filesystem FAT
- qemu-system-x86 - para probar la imagen sin necesidad de hardware real 

git clone --depth 1 https://github.com/torvalds/linux.git 
cd linux -> (Change the directory to Linux)
make menuconfig -> (Show a menu with the options, where select 64 bits)
make -j 2 ->  (Use 2 dores in your computer)

#git clone --depth 1 https://git.busybox.net/busybox
cd busybox -> It contains all the basic Unix utilities (ls, grep, vi, etc.) in a single executable.

make menuconfig: Configure the BusyBox. EFREFREFREFRE
fff

