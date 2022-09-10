#!/bin/bash
echo "enter the name of the new table you want delete from: "
read tbdel
if [ ! -z $tbdel ]
then
if [ -f ./database/$dbcurr/"$tbdel" ]
then
	typeset -i fieldsnum=`awk -F: '{if(NR==1){print NF}}' ./database/$dbcurr/$tbdel`
		for (( i=1; i<=$fieldsnum; i++ ))	

		do
			fieldin=`awk -F: -v"i=$i" '{if(NR==1){print $i}}' ./database/$dbcurr/$tbsel`
			echo "do you want to delete by $fieldin (y/n): "
			read resp
			if [[ $resp = "y" || "$resp" = "Y" || "$resp" = "yes" || "$resp" = "YES" ]]
			then
				echo "enter a value for $fieldin to delete its record(s): "
				read valuedel
				if [[ $valuedel = $fieldin ]]
				then
					echo can"'"t be deleted
				        break	
				else
				#sed '1,2d' ./database/$dbcurr/$tbsel|awk -F: -v"i=$i" '{if ($i~'$valuesel')print $0}'
				#awk -F: -v"i=$i" '{if( $i == '$valuesel' )print $0}' ./database/$dbcurr/$tbsel
					awk -F: -v"i=$i" '{if( $'$i'!="'$valuedel'" )print $0}' ./database/$dbcurr/$tbdel > ./database/$dbcurr/tmp
			        	diff ./database/$dbcurr/$tbdel ./database/$dbcurr/tmp > ./op
					if [ ! $? -eq 0 ]
						then
						mv ./database/$dbcurr/tmp ./database/$dbcurr/$tbdel
						echo deleted	
				
					else
						rm ./database/$dbcurr/tmp
						echo nothing is deleted
					fi
			        fi
				break
			elif [[ $resp = "n" || "$resp" = "N" || "$resp" = "no" || "$resp" = "NO" ]]
			then
				echo skip
			fi
		done















	else
	echo "this table isn't exist"
fi
else
	echo "empty table name"
fi
. ./connect_menu.sh
