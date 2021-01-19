import yagmail

yag = yagmail.SMTP(user="发件人地址",password="邮箱验证码",host="smtp.163.com")
for i in range(10):
    content = ""
    yag.send('收件人地址','subject',contents=content)