#!/bin/bash
PS3="enter your choice: "
echo "======================================================================="
select choice in "Creat database" "List database" "Connect to database" "Drop database" "Exit"
do 
case $REPLY in
1) echo "enter new database name: "
   read dbname
   if [ ! -z $dbname ]
   then
   if [ ! -d ./database/"$dbname" ]
   then
   	case "$dbname" in
   	#+([[:upper:]])) mkdir ./database/"$dbname"
   	#;;
   	#+([[:lower:]])) mkdir ./database/"$dbname"
   	#;;
   	+([0-9])) echo name of data base can"'"t be a number
   	;;
   	+([A-Za-z0-9])) mkdir ./database/"$dbname"
   	;;
   	*) echo wrong name
   	;;
   	esac
   #to be modified
   else
   echo "this name is taken" 
   fi
   else
   echo "empty database name"
   fi
   . ./main_menu.sh
;;	
2) ls -F ./database| grep / 
      . ./main_menu.sh
;;
4) echo "enter name of database you want to remove"
   read dbrm
   if [  ! -z $dbrm ]
   then
   if [ -d ./database/"$dbrm" ]
   then
   rm -r ./database/"$dbrm"
   echo "$dbrm database was deleted"
   else
   echo "this name is not found"
   fi
   else
   echo "empty database name"
   fi
   . ./main_menu.sh
;;
3) echo "enter name of database you want to connect"
   read dbcurr
   if [ ! -z $dbcurr ]
   then
   if [ -d ./database/"$dbcurr" ]
   then
   . ./connect_menu.sh
   else
   echo "this name is not found"
   fi
   else
   echo "empty database name"
   fi
;;
5) break 2 ;;
*)break ;;
esac
echo "========================================================================"
done
