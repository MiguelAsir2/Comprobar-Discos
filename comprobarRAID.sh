#! /bin/bash
#Con el paquete mdadm comprobaremos el estado del RAID y si no está instalado nos indicará
#como obtener el paquete.
comprobarraid()
{
	if [ "$(dpkg -s mdadm | egrep Status)" = "Status: install ok installed" ]
	then
		read -p "¿Desea comprobar un RAID?: " opcion
		case $opcion
		in
		S|s)
			echo ""
			cat /proc/mdstat
			echo ""
			read -p "¿Que RAID deseas comprobar?: " raid
			echo ""
			mdadm -D /dev/$raid
		;;
		N|n)
			echo ""
			echo "-- COMPROBACION DE RAID CANCELADA --"
		;;
		esac
	else
		echo ""
		echo "-- FALTA PAQUETERIA --"
		echo ""
		echo "Para obtener el paquete seleccione la opcion 2."
	fi
}

#Funcion que te permite crear un RAID 1 y RAID 5.
crearraid()
{
	if [ "$(dpkg -s mdadm | egrep Status)" = "Status: install ok installed" ]
	then
		read -p "¿Desea crear algun RAID?: " opcion
		case $opcion
		in
		S|s)
			read -p "¿Que tipo de RAID quieres hacer?(1 ó 5): " opcion
			case $raid
			in
			1)	#RAID1
				echo ""
				read -p "Introduzca el nombre del RAID: " nombre
				read -p "Introduce el primer dispositivo: " disp1
				read -p "Introduce el segundo dispositivo: " disp2
				mdadm --create /dev/md/$nombre --level=1 --raid-devices=2 /dev/$disp1 /dev/$disp2
				echo ""
				echo "-- RAID 1 CREADO --"
			;;
			5)
				#RAID5
				read -p "Introduzca el nombre del RAID: " nombre
				read -p "Introduzca el primer dispositivo: " disp1
				read -p "Introduzca el segundo dispositivo: " disp2
				read -p "Introduzca el tercer dispositivo: " disp3
				mdadm --create /dev/$nombre --level=5 --raid-devices=2 /dev/$disp1 /dev/$disp2 /dev/$disp3
	 			echo ""
				echo "-- RAID 5 CREADO --"
			;;
			esac

		;;
		N|n)
			echo ""
			echo "-- CANCELADA COMPROBACION DEL RAID --"
			echo ""
		;;
		esac

	else
		echo ""
		echo "-- NECESITA LA PAQUETERIA --"
		echo ""
		echo "Para obtener esta paqueteria debe elegir la opcion 2."
		echo ""
	fi
}
