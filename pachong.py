import  requests
from urllib import request
import re
import os
import datetime
#创建目录
date=datetime.datetime.now().date()
dir=r'F:\text\iamge'+ r'\%s' % date
if not os.path.exists(dir):
   os.mkdir(dir)
# 步骤
# 1.确定要爬取数据的网址
# 2.获取该网址的源码
# 3.使用正则表达式去匹配网址的源码（匹配所需要的数据类型）
# 4.将爬取的数据保存至本地或者数据库
# 确定要爬取数据的网址
url= "https://www.1905.com/dianyinghao/"
# 该网址的源码(以该网页的原编码方式进行编码，特殊字符编译不能编码就设置ignore)
webSourceCode= request.urlopen(url).read().decode("utf-8")
# 匹配数据的正则表达式
# 所有的图片
imgRe=re.compile(r'src="(.*?\.jpeg|.*?\.jpg)"')
images=imgRe.findall(webSourceCode)
print("图片==============================================================")
num = 0
for image in images:
    image_url=image
    # 下载图片
    pic = requests.get(image_url)
    image_file = dir+'\\'+ image.split("/")[-1]
    # 判断图片是否存在
    if not os.path.exists(image_file):
        with open(image_file,'wb') as fobj:
            fobj.write(pic.content)
    if os.path.exists(image_file):
        print("图片下载成功！！！")
        num += 1
print("一共爬取%s张图片" % num)















