#!/bin/bash
#

read -p "输入网段：" ip

num1=$(echo $ip|cut -d "." -f1)
num2=$(echo $ip|cut -d "." -f2)
num3=$(echo $ip|cut -d "." -f3)

ip_all=${num1}.${num2}.${num3}

declare -a num
a=0
for i in $(seq 254);
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
		
	





