#!/bin/bash
echo "====================================================================="
echo "welcome to $dbcurr database"
PS3="enter your choice for $dbcurr: "
select choice in "Creat table" "List tables" "Drop table" "Insert into table" "Select from table" "Delete from table" "Update table" "Back to Previous menu"
do
case $REPLY in
1) . ./creat_tb.sh
;;
2) ls ./database/$dbcurr
   . ./connect_menu.sh
;;
3) echo "enter name of table you want to remove"
   read tbrm
   if [ -f ./database/$dbcurr/$tbrm ]
   then
   rm -r ./database/$dbcurr/$tbrm
   echo $tbrm table is deleted from $dbcurr database
   else
   echo "this table is not found"
   fi
   . ./connect_menu.sh
;;
4) . ./insert_tb.sh
;;
5) . ./select_tb.sh
;;
6) . ./delete_fm_tb.sh
;;
7) . ./update_tb.sh
;;
8) . ./main_menu.sh
;;
*) echo wrong input
   . ./connect_menu.sh
;;
esac
echo "==================================================================="
done
