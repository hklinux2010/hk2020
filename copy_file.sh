#!/bin/bash
#
read -p "源文件：" s_file

# 判断写的源文件是否含有“/”
if [ "/" !=  *"$s_file"* ];then
	find / -name $s_file
	read -p "源文件：" s_file
fi

# 判断文件是否存在
if [ -e $s_file ];then
	read -p "备份目录：" d_dir
# 判断目录是否存在
	if [ -d $d_dir ];then
		cp $s_file $d_dir
# 判断复制操作是否成功
		if [ $? -eq 0 ];then
			echo "复制成功！！！"
		else
			echo "复制失败！！！"
		fi
	else
		while true;
		do
			read -p "是否确认创建此目录$d_dir(Y/N)" choice
			if [ $choice == "Y" ];then
		 		mkdir -p $d_dir
				cp $s_file $d_dir
				echo "备份成功！！！"
				break
			elif [ $choice == "N" ];then
				echo "退出程序，拜拜！！！"
				break
			else
				echo "选择错误,重新选择！！！"
				continue
			fi
		done
	fi
else
	echo "文件不存在！！！"
fi
		
		






