#/bin/bash
xxx=$(awk -F: '{if($1==2) print NR}' ./stu)
#echo xxx  
sed ''$xxx'd' stu
#awk -F: '{if($1!=2) print $0}' ./stu  > tmp && mv tmp stu
