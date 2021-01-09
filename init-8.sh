#!/bin/bash

yum -y update

cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
echo 'Asia/Shanghai' >/etc/timezone

yum install -y net-tools  pcre-devel pcre tcpdump rsync openssh mysql-devel iotop bzip2 bzip2-devel patch sqlite-devel readline-devel vim tree gcc gcc-c++ automake autoconf libtool make wget lsof man openssh-clients openssl-devel lm_sensors dmidecode unzip boost lrzsz gdb ipmitool sysstat telnet wntp

cat <<EOF >> /etc/sysctl.conf
# New
net.ipv4.tcp_sack = 1
net.ipv4.tcp_window_scaling = 1
net.ipv4.tcp_timestamps = 0
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_fin_timeout = 1
net.ipv4.tcp_keepalive_time = 30
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_synack_retries = 1
net.ipv4.tcp_syn_retries = 1
net.ipv4.ip_local_port_range = 20000 65000
net.ipv4.tcp_max_syn_backlog = 8192
net.ipv4.tcp_max_tw_buckets = 30000
net.ipv4.tcp_max_orphans = 3276800
net.ipv4.tcp_max_syn_backlog = 262144
net.ipv4.tcp_rmem = 4096        87380   4194304
net.ipv4.tcp_wmem = 4096        16384   4194304
net.ipv4.tcp_mem = 94500000 915000000 927000000
net.ipv6.conf.all.disable_ipv6 = 1
net.core.wmem_default = 8388608
net.core.rmem_default = 8388608
net.core.rmem_max = 16777216
net.core.wmem_max = 16777216
net.core.somaxconn = 262144
net.core.netdev_max_backlog = 262144
EOF

mkdir /root/.pip
cat <<EOF >/root/.pip/pip.conf
[global]
index-url = https://pypi.doubanio.com/simple/
extra-index-url = https://pypi.doubanio.com/simple/

[install]
trusted-host=pypi.doubanio.com

[list]
format=columns
EOF

sed -i '/^# End of file/i *\tsoft\tnofile\t102400\n*\tsoft\tnproc\t102400\n*\thard\tnofile\t102400\n*\thard\tnproc\t102400' /etc/security/limits.conf
sed -i 's/^SELINUX=.*/SELINUX=disabled/' /etc/selinux/config
sed -i 's/^#Port 22/Port 53022/' /etc/ssh/sshd_config

systemctl restart sshd
systemctl stop firewalld
systemctl disable firewalld





