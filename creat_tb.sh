#!/bin/bash
echo "enter the name of the new table: "
read tbnm
if [ ! -f ./database/$cname/"$tbnm" ]
   then
   touch ./database/$cname/"$tbnm"
   else
   echo "this table is already exist"
fi
echo  name >> database/$cname/$tbnm
echo  dtype >> database/$cname/$tbnm.tp
