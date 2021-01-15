#!/bin/bash
#


# 此参数都可以进行修改
nginx_cmd="/usr/local/nginx/sbin/nginx"
nginx_pid="/usr/local/nginx/logs/nginx.pid"

if [ $# -eq 0 ];then
	echo "用法: $0 {start|stop|restart|status}"
	exit 100
fi

case $1 in
	start)
		$nginx_cmd
		if [ $? -eq 0 ];then
			echo "nginx启动成功！！！"
		fi
	;;
	stop)
		$nginx_cmd -s stop
		netstat -antp|grep nginx &> /dev/null
		if [ $? -ne 0 ];then
			echo "nginx关闭成功！！！"
		fi
	;;
	restart)
		$nginx_cmd -s stop
		echo "正在关闭nginx......"
		netstat -antp|grep nginx &> /dev/null
		if [ $? -ne 0 ];then
			echo "nginx关闭成功！！！"
		fi
		
		sleep 1
		
		$nginx_cmd
		echo "正在启动nginx......"
		netstat -antp|grep nginx &> /dev/null
		if [ $? -eq 0 ];then
			echo "nginx启动成功！！！"
		fi
	;;
	status)
		if [ -e $nginx_pid ];then
			echo "nginx(PID $(cat $nginx_pid))正在运行！！！"
		else
			echo "nginx已经关闭！！！"
		fi
	;;
	*)
		echo "选择错误！！！"
		echo "用法: $0 {start|stop|restart|status}"
	;;
esac		
	


