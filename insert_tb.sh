#!/bin/bash -x
echo "enter the name of the new table you want to insert in: "
read tbin
if [ ! -z $tbin ]
then
if [ -f ./database/$dbcurr/"$tbin" ]
then	
	typeset -i fieldsnum=`awk -F: '{if(NR==1){print NF}}' ./database/$dbcurr/$tbin`
	echo $fieldsnum	
	for (( i=1; i<=$fieldsnum; i++ ))	
	do
		fieldin=`awk -F: -v"i=$i" '{if(NR==1){print $i}}' ./database/$dbcurr/$tbin`
		echo "enter $fieldin : "
	      	read fvalue
		fieldtype=`awk -F: -v"i=$i" '{if(NR==2){print $i}}' ./database/$dbcurr/$tbin`
		while true
		do
			if [[ $fvalue = +([0-9]) && "$fieldtype" = "int" || $fvalue = +([a-zA-Z]) && "$fieldtype" = string ]]
			then
				if [ $i -eq 1 ]
				then
					fdata=$fvalue
				else
					fdata=$fdata":"$fvalue
				fi	
				echo $fieldin is inserted
				break	
			else
				echo $fieldin must be $fieldtype !!!
				echo "enter $fieldin : "
                		read fvalue
			fi
		done
	done

echo $fdata >> ./database/$dbcurr/"$tbnm" 
else
	echo "this table isn't exist" 
fi
else	
	echo "empty table name"
fi
