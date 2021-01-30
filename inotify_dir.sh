#!/bin/bash
#


read -p "请输入要监控的目录：" file_dir

if [ ! -d "$file_dir" ];then
    echo "目录不存在"
    read -p "是否要创建新目录(Y/S)：" choice
    if [ $choice == "Y" ];then
       mkdir -p $file_dir
       if [ $? -eq "0" ];then
           echo "$file_dir创建成功！！！"
       fi
     else
        echo "拜拜！！！"
        exit 
     fi
fi
if [ ! -d "/data_log" ];then
    mkdir /data_log
fi
inotifywait -mrq --timefmt '%d %m %y %H:%M' --format '%T %w %f %e' -e modify,delete,create,attrib $file_dir &> /data_log/$(date +%Y_%m_%d_%H_%M).log &

pid=$(ps -elf|grep $file_dir|sed '$d'|awk '{print $4}')

echo "后台运行，输出日志在/data_log"
echo "进程号：$pid"






 



