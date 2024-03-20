#!/bin/bash

# Help menu
help(){
    echo "Instalación de Porteus v5.0 en los clientes ligeros"
    echo ""
    echo "Uso:"
    echo "  $(basename $0)"
    echo "  $(basename $0) -h"
    echo "  $(basename $0) -v"
    echo ""
    echo "Opciones:"
    echo "  -h    Muestra este menú"
    echo "  -v    Muestra la versión"
    echo ""
    echo "Este script realiza las siguientes acciones:"
    echo "   1) Formatea y particiona el disco duro del cliente ligero"
    echo "   2) Instala Porteus"
    echo ""
    echo "Nota: Este script debe de ser ejecutado con permisos de superusuario"
    echo ""
    echo "Autor: William Alexander"
}

# Check the options
while getopts ":hv" OPTIONS; do
    case "${OPTIONS}" in
        h)
            help
            exit 0
            ;;
        v)
            echo -n "Versión: "
            cat VERSION
            exit 0
            ;;
        *)
            echo "ERROR: La opción '-${OPTARG}' es incorrecta"
            help
            exit 1
            ;;
    esac
done

# Abort the execution if the user didn't run the script with root privileges
if [ "$EUID" != "0" ]; then
    echo "ERROR: El script debe de ser ejecutado con permisos de superusuario"
    help
    exit 1
fi

# Create the main partition of the thin client
parted --script /dev/sda mklabel msdos
parted --script -a optimal /dev/sda mkpart primary ext4 1MiB 100%
mkfs.ext4 /dev/sda1

# Mount the partition
mkdir -p /mnt/sda1
mount /dev/sda1 /mnt/sda1

# Copy the contents of the ISO file to the new partition
cp -r /mnt/sr0/boot /mnt/sda1
cp -r /mnt/sr0/porteus /mnt/sda1

# Install Porteus and poweroff the system
cd /mnt/sda1/boot
./Porteus-installer-for-Linux.com && poweroff