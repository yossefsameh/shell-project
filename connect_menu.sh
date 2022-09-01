#!/bin/bash
echo "====================================================================="
echo "welcome to $cname database"
PS3="enter your choice for $cname: "
select choice in "type 1 to creat table" "type 2 to list tables" "type 3 to drop table" "type 4 to insert into table" "type 5 to select from table" "type 6 to delete from table" "type 7 toubdate table" "type 8 to back to Previous menu"
do
case $REPLY in
1) . ./creat_tb.sh
;;
2) ls ./database/$cname
;;
3) echo "enter name of table you want to remove"
   read rmtb
   if [ -f ./database/$cname/"$rmtb" ]
   then
   rm -r ./database/$cname/"$rmtb"
   else
   echo "this table is not found"
   fi
;;
4)
;;
5)
;;
6)
;;
7)
;;
8) . ./main_menu.sh
;;
*)break
;;
esac
echo "==================================================================="
done
