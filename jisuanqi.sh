#!/bin/bash
#

fun1() {

	read -p "第一个数值：" num1
	read -p "第二个数值：" num2
}


echo "计算器"
while true
do
	echo -e  "\n"
	echo "1.加法"
	echo "2.减法"
	echo "3.乘法"
	echo "4.除法"
	echo "5.取余"
	echo "q.退出"
	read -p "算法：" num3
	case $num3 in
		1)
			fun1
			echo $num1+$num2=$((num1 + num2))
		;;
		2)
			fun1
			echo $num1-$num2=$((num1 - num2))
		;;
		3)
			fun1
			echo ${num1}x$num2=$((num1 * num2))
		;;
		4)
			fun1
			if [ $num2 == 0 ]
			then
				echo "被除数不能为0！！！"
				continue
			else
				echo $num1/$nmu2=$((num1/num2))
			fi
		;;
		5)	
			fun1
			if [ $num2 == 0 ]
			then
				echo "被除数不能为0！！！"
				continue
			else
				echo ${num1}%$num2=$((num1 % num2))
			fi
		;;
		q)
			echo "拜拜！！！"
			break
		;;
		*)
			echo "选择错误！！！"
			continue
		;;
	esac
done
