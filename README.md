# porteus-v5-installation

## Descripción

Este script está pensado para la fácil instalación de la distribución Porteus 
(v5.0) en los clientes ligeros. Se optó por esta distribución debido a los pocos 
recursos que consume.

## Acciones realizadas por el script

Este script particiona el disco duro del cliente ligero y después instala Porteus
en él.

## Ejecución del script

Se recomienda consultar el menú de ayuda para conocer las opciones disponibles y
saber cómo ejecutar el script de manera correcta. Lo anterior se logra ejecutando
el script de la siguiente manera:

    ./porteus-v5-installation.sh -h

Si solo desea instalar Porteus en el sistema, debe ejecutar el script de la
siguiente manera con permisos de super usuario (`root`):

    ./porteus-v5-installation.sh

Una vez ejecutado el script, este pedirá confirmar que el dispositivo en donde
se va a instalar Porteus es el correcto, es por ello que deberá teclear `ok` en 
minúsculas. Cuando la instalación finalice, se le pedirá dar click a la tecla
`enter`, lo cual finalizará el proceso de instalación y apagará el sistema.