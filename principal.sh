#!/bin/bash

#Funciones a utilizar en el script
. ./comprobarpaquetes.sh
. ./comprobarRAID.sh
. ./comprobarvolumenes.sh
. ./desfragmentardisco.sh

while true
do
	#MENU --> Nos indicará las diferente opciones que podemos realizar con el script
	cat << fin

	NOTA: EL SCRIPT DEBE EJECUTARSE CON PRIVILEGIOS DE ROOT

	1. COMPROBAR PAQUETERIA e2fsprogs
	2. COMPROBAR PAQUETERIA mdadm
	3. COMPROBAR DISPOSITIVOS DE BLOQUES CON BADBLOCKS
	4. CREA UN RAID
	5. COMPRUEBA UN RAID
	6. DESFRAGMENTAR PARTICION O FICHERO
	0. SALIR
	fin
	echo ""
	read -p "Elija un opcion: " opcion
	echo ""
	case $opcion
	in
	1)
		#Comprueba si la paquete e2fsprogs(para Badblocks) esta instalada
		echo ""
		echo "-- COMPROBANDO PAQUETERIA e2fsprogs"
		echo ""
		paquetebadblocks
		echo ""
	;;
	2)
		#Comrpueba si el paquete mdadm(para los RAID's) esta instalada
		echo ""
		echo "-- COMPROBANDO PAQUETERIA mdadm --"
		echo ""
		paquetemdadm
		echo ""
	;;
	3)
		#Comprueba los daños de los dispositivos de bloques con badblocks
		echo ""
		echo "-- COMPROBAR DISPOSITIVO DE BLOQUES CON BADBLOCKS --"
		echo ""
		dispositivodebloques
		echo ""
	;;
	4)
		#Permite la creacion de un RAID 1 ó 5.
		echo ""
		echo "-- CREAR RAID --"
		echo ""
		crearraid
		echo ""
	;;
	5)
		#Comprueba el estado de los RAID's
		echo ""
		echo "-- COMPROBAR RAID --"
		echo ""
		comprobarraid
		echo ""
	;;
	6)
		#Desfragmenta dispositivos de bloques y ficheros.
		echo ""
		echo "-- DESFRAGMENTAR DISPOSITIVO DE BLOQUES O FICHERO"
		echo ""
		desfragmentar
		echo ""
	;;
	0)
		#Con esta opcion podremos salir del script
		echo "-- SALIENDO DEL SCRIPT --"
		echo ""
		echo "GRACIAS. HASTA LA PROXIMA"
		echo ""
		break
	;;
	esac
done
