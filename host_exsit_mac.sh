#!/bin/bash
#

read -p "输入网段：" ip

num1=$(echo $ip|cut -d "." -f1)
num2=$(echo $ip|cut -d "." -f2)
num3=$(echo $ip|cut -d "." -f3)

ip_all=${num1}.${num2}.${num3}

declare -a num
a=0
for i in $(seq 83);
do
    ping ${ip_all}.$i -c 1 -w 1 &> /dev/null
    if [ $? == 0 ];
    then
   		 echo "主机${ip_all}.${i}在线"
		((a+=1))
		 num[$i]=$i
    fi
done
echo "一共在线主机$a台"

getMac(){

while true;
do
	read -p  "是否获取在线主机的MAC地址（Y/N）" choice

	choice=${choice^}

	case $choice in 
		Y)
			for j in ${num[*]};
			do
				mac=$(arping -c 1 -w 1 ${ip_all}.${j}|awk -F [ '/Unicast/ {print $2}'|awk -F ] '{print $1}')
				echo "主机ip：${ip_all}.${j} 主机mac：$mac"
			done
			exit 100
		;;
		N)
			echo "拜拜！！！"
			exit 100
		;;
		*)
			echo "选择错误！！"
			continue
		;;
	esac
done
}

link(){
	 read -p "连接主机的ip：" ip
     read -p "输入用户名：" user
	 while true;
	 do
	 	stty -echo
	 	read -p "输入密码：" pass1
	 	read -p "再次输入密码：" pass2
		stty echo
		if [ $pass1 == $pass2 ];
		then
	 		sshpass  -p $pass1 ssh  ${user}@${ip}
			break
		else
			continue
		fi
	 done

}

cat << eof

------主机操作-----
1.获取Mac地址
2.连接主机

eof


read -p "请选择：" num

case $num in
	1)
		getMac

	;;
	2)
		link
		exit 100
	
	;;
	*)
		echo "选择错误！！！"
		exit 100
	;;

esac

