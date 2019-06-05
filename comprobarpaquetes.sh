#!/bin/bash

#Comprueba los paquetes necesarios

#Comprueba e instala el paquete e2fsprogs para usar Badblocks para comprobar
#los dispositivos.
paquetebadblocks()
{
	echo "-- COMPROBANDO PAQUETERIA --"
	#Si la paqueteria esta instalada saldra de nuevo al menu
	if [ "$(dpkg -s e2fsprogs | grep Status)" = "Status: install ok installed" ]
	then
		echo ""
		echo "-- PAQUETERIA INSTALADA --"
		echo ""
	#Si la paqueteria no esta instalada consultara al usuario si desea instalarla
	else
		echo ""
		echo "-- PAQUETERIA NO INSTALADA --"
		echo ""
		while true
		do
			read -p "¿Desea instalar e2fsprogs?: " opcion
			case $opcion
			in
			S|s)
				#Instalacion del paquete e2fsprogs
				echo "-- INSTALANDO PAQUETE e2fsprogs --"
				apt-get install e2fsprogs
				echo ""
				break
			;;
			N|n)
				#Muestra que el usuario ha cancelado la instalacion del paquete
				echo "-- INSTALACION DEL PAQUETE e2fsprogs DENEGADA --"
				echo ""
				break

			;;
			esac
		echo "-- OPCION INCORRECTA --"
		echo ""
		done
	fi
}
#Paquetería necesaria para gestionar RAIDS (crea y analiza los RAIDS)
paquetemdadm()
{
	#Comprueba si el paquete mdadm(RAID) esta instalado
	if [ "$(dpkg -s mdadm | grep Status)" = "Status: install ok installed" ]
	then
		echo "-- PAQUETERIA INSTALADA --"
	else
		#Si la paqueteria no esta instalada le cosultara la usuario si desea instalarla
		echo "-- PAQUETERIA NO INSTALADA --"
		echo ""
		while true
		do
			read -p "¿Desea instalar el paquete mdadm?: " opcion
			case $opcion
			in
			S|s)
				echo ""
				echo "-- INSTALANDO PAQUETE mdadm --"
				echo ""
				apt-get install mdadm
			;;
			N|n)
			#Mostrara que el usuario ha cancelado la instalacion del paquete
				echo ""
				echo "-- INSTALACION DEL PAQUETE mdadm DENEGADA --"
			;;
			esac
		echo "-- OPCION INCORRECTA --"
		done
	fi
}
