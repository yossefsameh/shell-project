#!/bin/bash
echo "enter the name of the new table you want select from: "
read tbsel
if [ ! -z $tbsel ]
then
if [ -f ./database/$dbcurr/"$tbsel" ]
then
	select choice in "type 1 to select all" "type 2 to select part" "back to$dbcurr menu "
	do
	case $REPLY in
	1) sed '2d' ./database/$dbcurr/$tbsel
	;;
	2) select choice in "type 1 to select specific record(s)" "type 2 to select all column" "back to select menu "
		do
		case $REPLY in
		1) typeset -i fieldsnum=`awk -F: '{if(NR==1){print NF}}' ./database/$dbcurr/$tbsel`
		for (( i=1; i<=$fieldsnum; i++ ))	
		do
			fieldin=`awk -F: -v"i=$i" '{if(NR==1){print $i}}' ./database/$dbcurr/$tbsel`
			echo "do you want to search by $fieldin (y/n): "
			read resp
			if [[ $resp = "y" || "$resp" = "Y" || "$resp" = "yes" || "$resp" = "YES" ]]
			then
				echo "enter a value for $fieldin to search by: "
				read valuesel
				sed '1,2d' ./database/$dbcurr/$tbsel|awk -F: -v"i=$i" '{if ($i~"$valuesel"){print $0}}'

				break
			elif [[ $resp = "n" || "$resp" = "N" || "$resp" = "no" || "$resp" = "NO" ]]
			then
				echo ops
			fi

		done
		;;
	        2)
		;;
		esac
		done
	;;
        3). ./connect_menu.sh
	;;
esac
echo "==================================================================="
done













else
	echo "this table isn't exist" 
fi
else	
	echo "empty table name"
fi	
