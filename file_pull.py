import paramiko
import sys
import os
from save import md5

def getlocalMD5(file_name):
    local_file_md5 = md5.getmd5(filename=file_name)
    return local_file_md5
def get_range_md5(d_dir,file_name,ip,user,pwd,port=22):
    sshclient=paramiko.SSHClient()
    sshclient.set_missing_host_key_policy(paramiko.AutoAddPolicy)
    try:
        sshclient.connect(hostname=ip,username=user,password=pwd,port=port)
    except Exception as e:
        print("建立连接失败！！！")
        print(e)
        sys.exit()
    if d_dir.endswith("/"):
        d_file = d_dir + os.path.basename(file_name)
    else:
        d_file = d_dir + "/" + os.path.basename(file_name)

    md5_cmd = "md5sum %s | awk '{print $1}'" % d_file

    stdin, stdout, stderr = sshclient.exec_command(md5_cmd)
    return  stdout.read().decode("utf-8").strip()

    sshclient.close()
def upload_file(ip,user,pwd,s_file,d_dir,port=22):
    if d_dir.endswith("/"):
        d_file = d_dir + os.path.basename(s_file)
    else:
        d_file = d_dir + "/" + os.path.basename(s_file)
    try:
        sshconn = paramiko.Transport((ip,port))
    except Exception as e:
        print("ssh连接建立失败！！！")
        print(e)
        sys.exit()
    try:
        sshconn.connect(username=user,password=pwd)
    except Exception as e:
        print("ssh连接建立失败！！！")
        print(e)
        sys.exit()

    ftpclient = paramiko.SFTPClient.from_transport(sshconn)
    ftpclient.put(s_file,d_file)

    ftpclient.close()
    sshconn.close()

if __name__ == '__main__':
    s_file = input("源文件：")
    d_dir = input("服务器目录：")
    ip = input("ip地址：")
    user = input("用户名：")
    pwd = input("密码：")
    local_md5 = getlocalMD5(file_name=s_file)
    upload_file(ip=ip,user=user,pwd=pwd,s_file=s_file,d_dir=d_dir)
    d_md5 = get_range_md5(d_dir=d_dir,file_name=s_file,ip=ip,user=user,pwd=pwd)
    print(local_md5)
    print(d_md5)
    if local_md5 == d_md5:
        print("上传成功！！！")
    else:
        print("文件有变化！！！")
    # print(get_range_md5(d_dir=r"/root",file_name=r"F:\text\save\re-link.py",ip="192.168.102.70",user="root",pwd="123456"))








