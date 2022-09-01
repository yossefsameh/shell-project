#!/bin/bash
PS3="enter your choice: "
echo "======================================================================="
select choice in "type 1 to creat database" "type 2 to list database" "type 3 to drop database" "type 4 to connect to database"
do 
case $REPLY in
1) echo "enter new database name: "
   read dbname
   if [ ! -d ./database/"$dbname" ]
   then
   	case "$dbname" in
   	+([[:upper:]])) mkdir ./database/"$dbname"
   	;;
   	+([[:lower:]])) mkdir ./database/"$dbname"
   	;;
   	+([0-9])) echo name of data base can"'"t be a number
   	;;
   	+([A-Za-z0-9])) mkdir ./database/"$dbname"
   	;;
   	*) echo wrong name
   	;;
   	esac
   else
   echo "this name is taken" 
   fi
;;	
2) ls -F ./database| grep / 
;;
3) echo "enter name of database you want to remove"
   read rmname
   if [ -d ./database/"$rmname" ]
   then
   rm -r ./database/"$rmname"
   echo "$rmname database was deleted"
   else
   echo "this name is not found"
   fi
;;
4) echo "enter name of database you want to connect"
   read cname
   if [ -d ./database/"$cname" ]
   then
   . ./connect_menu.sh
   else
   echo "this name is not found"
   fi

;;
*)break ;;
esac
echo "========================================================================"
done
