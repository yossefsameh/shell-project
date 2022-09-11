#!/bin/bash
echo "enter the name of the new table: "
read tbnm
if [ ! -z $tbnm ]
then
if [ ! -f ./database/$dbcurr/"$tbnm" ]
	then
	#check constraints firstly for tb name
	touch ./database/$dbcurr/"$tbnm"
	echo "enter the number of fields"
	read nfields
	typeset -i nfields=$nfields 
	while [ $nfields -eq 0 ]
		do 
		echo "you didn't enter the number of fields"
		echo "enter the number of fields"
        	read nfields
 	done
	for (( i=1; i<=$nfields; i++ ))
	do
		if [ $i -eq 1 ]
			then
			echo "enter the name of field $i note that its primary key: "
			read fname
			meta1=$fname 
			PS3="enter datatype of field $i: "
                	select choose in "int" "string"
                	do
                		case $REPLY in
               			1)ftype=int
				#echo -n $name":" >> data/$1/$tbname;
				
                		break
                		;;
                		2)ftype=string
                		break
                		;;
                	esac
        		done
			meta2=$ftype 
			elif [[ $i -gt 1 ]] && [[ $i -le $nfields ]]
			then
			echo enter the name of field $i: 
                        read fname
			meta1=$meta1":"$fname
		  	PS3="enter datatype of field $i: "
                        select choose in "int" "string"
                        do
                                case $REPLY in
                                1)ftype=int
                                break
                                ;;
                                2)ftype=string
                                break
                                ;;
                        esac
                        done
			meta2=$meta2":"$ftype	

		fi 

	done
echo $meta1 >> ./database/$dbcurr/"$tbnm" 
echo $meta2 >> ./database/$dbcurr/"$tbnm" 
echo finished, table created successfully. going back to menu

else
	echo "this table is already exist"
	fi
else
echo "empty table name"
fi
. ./connect_menu.sh
#echo  name >> database/$tbcurr/$tbnm
#echo  dtype >> database/$tbcurr/$tbnm.tp
