#!/bin/bash
echo "enter the name of the new table: "
read tbnm
if [ ! -f ./database/$dbcurr/"$tbnm" ]
   then
   touch ./database/$tbcurr/"$tbnm"
   else
   echo "this table is already exist"
fi
echo  name >> database/$tbcurr/$tbnm
echo  dtype >> database/$tbcurr/$tbnm.tp
