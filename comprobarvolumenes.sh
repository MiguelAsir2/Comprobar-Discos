#!/bin/bash

#Esta funcion muestra los dispositivos y realiza la comprobacion de los dispositivos
#por si existieran fallos.¡¡BADBLOCKS!!

dispositivobloques()
{
	echo ""
	echo "-- MOSTRANDO DISPOSITIVOS DE BLOQUES --"
	echo ""
	lsblk --output NAME,MOUNTPOINT
	echo ""
	read -p "¿Desea comprobar algun disco?: " opcion
	echo ""
	while true
	do
		case $opcion
		in
		S|s)
			if [ "$(dpkg -s e2fsprogs | grep Status)" = "Status: install ok installed" ]
			then
				read -p "¿Que disco desea comprobar?: " disco
				if [ "/dev/$disco" in "$(cat /proc/mounts)" ]
				then
					echo ""
					echo "-- DESMONTANDO DISCO --"
					echo ""
					umount /dev/$disco
					echo "-- COMPROBANDO FALLOS EN EL DISCO --"
					echo ""
					badblocks -nsv /dev/$disco
				else
					echo ""
					echo "-- COMPROBANDO DISCO --"
					echo ""
					badblocks -nsv /dev/$disco
				fi
			else
				echo ""
				echo "-- NO INSTALADA LA PAQUETERIA --"
				echo ""
				echo "Si desea obtener la paqueteria seleccione la opcion 1."
			fi
		;;
		N|n)
			echo ""
			echo "-- SALTANDO COMPROBACIONES DE DISCOS --"
		;;
		esac
	done
}
