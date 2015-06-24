#!/bin/bash

#could be used for alternative php versions
phpplaces="
/etc/php5/fpm/pool.d
/opt/php-5.4.41/etc/pool.d
"

for mypath in $phpplaces; do
echo $mypath
 for MAILLOG in `grep -nHR "mail.log" $mypath/* | sed 's/ /:/g' `; do
  myinput=`echo $MAILLOG | sed 's/:/ /g'`
  myfile=`echo $myinput |awk {' print $1 '}`
  mymaillog=`echo $myinput |awk {' print $5 '}`
  lowner=`cat $myfile | grep "listen.owner" |awk {' print $3 '}`
  lgroup=`cat $myfile | grep "listen.group" |awk {' print $3 '}`
  if [ ! -f $mymaillog ];then
   echo $mymaillog not exists, creating and chmod
   touch $mymaillog
   chown $lowner:$lgroup $mymaillog
  fi
 done
done

