#!/bin/bash
#

while read line;do

name=$(echo $line|awk -F: '{print $1}')
Uid=$(echo $line|awk -F: '{print $3}')
Gid=$(echo $line|awk -F: '{print $4}')
comment=$(echo $line|awk -F: '{print $5}')
home_dir=$(echo $line|awk -F: '{print $6}')
sh_name=$(echo $line|awk -F: '{print $7}')

mysql -uroot -e "insert into text.userinfo(name,uid,gid,comment,home_dir,sh_name) values('$name','$Uid','$Gid','$comment','$home_dir','$sh_name')"







done < /etc/passwd



