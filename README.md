# ispconfig-conf

files goes to /usr/local/ispconfig/server/conf (debian)

Made because im lazy and dont want to change them everytime i need a unbranded setup of ispconfig.

This makes sperated mail.log files for each websites.


install :

cp -rf conf/* /usr/local/ispconfig/server/conf-custom/

cp check-web-mail-log.sh /root/scripts
cp nginx* /root/scripts

insert to /etc/crontab

*/10 * * * * root /root/scripts/check-web-mail-log.sh >/dev/null 2>&1
