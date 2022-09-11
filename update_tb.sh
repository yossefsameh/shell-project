#!/bin/bash
echo "enter the name of the table you want to ubdate: "
read tbup
if [ ! -z $tbup ]
then
if [ -f ./database/$dbcurr/"$tbup" ]
then	
	#typeset -i fieldsnum=`awk -F: '{if(NR==1){print NF}}' ./database/$dbcurr/$tbup`
	typeset -i fieldsnum=`awk -F: '{if(NR==1){print NF}}' ./database/$dbcurr/$tbup`
	prim_up=`awk -F: '{if(NR==1){print $1}}' ./database/$dbcurr/$tbup`
	echo "enter $prim_up (primary key) of record you want to update: "
	read entered_prim
	cut -f1 -d: ./database/$dbcurr/$tbup|tail -n+3|grep -w $entered_prim
	if [ $? -eq 0 ]
	then
		for (( i=2; i<=$fieldsnum; i++ ))	
		do
			fieldin=`awk -F: -v"i=$i" '{if(NR==1){print $i}}' ./database/$dbcurr/$tbup`
			fieldtype=`awk -F: -v"i=$i" '{if(NR==2){print $i}}' ./database/$dbcurr/$tbup`
			echo "do you want to change  $fieldin (y/n): "
			read resp
			if [[ $resp = "y" || "$resp" = "Y" || "$resp" = "yes" || "$resp" = "YES" ]]
			then
				echo "enter a new value for $fieldin : "
				read valueup
				while true
				do
					if [[ $valueup = +([0-9]) && "$fieldtype" = "int" || $valueup = +([a-zA-Z]) && "$fieldtype" = string ]]
					then
						awk -F: -v"i=$i" '{if( $1 == '$entered_prim' ){ $i = "'$valueup'" };gsub(" ",":",$0); print $0}' ./database/$dbcurr/$tbup > ./database/$dbcurr/tmp && mv ./database/$dbcurr/tmp ./database/$dbcurr/$tbup
						echo $tbup is updated
						break 2

					else
						echo $fieldin must be $fieldtype !!!
						echo "enter a new value for $fieldin : "
                                		read valueup
					fi
				done

			elif [[ $resp = "n" || "$resp" = "N" || "$resp" = "no" || "$resp" = "NO" ]]
			then
				echo skip
			fi
		done
			
			
			
	else
		echo this primary key is not found
	fi
	
else
	echo "this table isn't exist" 
fi
else	
	echo "empty table name"
fi
. ./connect_menu.sh	
