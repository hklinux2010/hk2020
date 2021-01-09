#!/bin/bash
#

a=$1
b=$2


if [ $a -eq $b ]
then
	echo "$a 等于 $b"
elif [ $a -lt $b ]
then
	echo "$a 小于 $b"
else
	echo "$a 大于 $b"
fi


for i in 1 2 3 4 5
do 
echo "$i"
done

for i in It is a text
do

    if [ $i == "a" ] 
	then
		printf "12\n"
	else
		printf "$i\n"
	fi
done


int=-8
#while (( $int<=5 ))
#do 
#	int=$(($int + 1))
#	echo $int
#	((int++))
#done













#echo '按下 <CTRL-D> 退出'
#echo -n '输入你最喜欢的网站名: '
#while read FILM
#do
#    echo "是的！$FILM 是一个好网站"
#done


#while true
#do
#	if [ $int -eq 7 ]
#	then
#		break
#	else
#		echo $int
#	((int++))
#	fi
#done

while true
do
	echo "输入1到4之间的整数"
	echo "输入q退出"
	read -p "输入的数字为：" num
	case $num in
		1)	
			echo "你选择了$num"
		;;
		2)
			echo "你选择了$num"
		;;
		3)	
			echo "你选择了$num"
		;;
		4)
			echo "你选择了$num"
		;;
		q)
			echo "拜拜！！！"
			break
		;;
		*)
			echo "你没有按原则选择数字！！！"
		;;
	esac
	
done




























