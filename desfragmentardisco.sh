#!/bin/bash

desfragmentar()
{
	echo "-- DESFRAGMENTAR --"
	echo ""
	cat << fin
	1. Dispositivo
	2. Fichero
	fin
	read -p "¿Desea realizar una desfragmentacion?: " opcion
	echo ""
	while true
	do
		case $opcion
		in
		S|s)
			read -p "¿Que desea desfragmentar?: " opcion
			case $opcion
			in
			1)
				echo ""
				echo "-- DESFRAGMENTANDO DISPOSITIVO --"
				echo ""
				read -p "¿Que particion desea desfragmentar?: " particion
				echo ""
				echo "-- DESFRAGMENTANDO /dev/$particion --"
				echo ""
				e4defrag /dev/$particion
				echo ""
				break
			;;
			2)
				echo ""
				echo "-- DESFRAGMENTANDO FICHERO --"
				echo ""
				read -p "Escriba la ruta a defragmentar: " ruta
				echo ""
				e4defrag $ruta
				echo ""
				break
			;;
			esac
		;;
		N|n)
			echo ""
			echo "-- SALIENDO DE LA DEFRAGMENTACION --"
			echo ""
		;;
		esac
	echo ""
	echo "-- OPCION INCORRECTA --"
	echo ""
	done
}
