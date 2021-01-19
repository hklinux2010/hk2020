import smtplib
from email.header import Header
from email.mime.text import MIMEText
from email.utils import parseaddr, formataddr


def __format_addr(k):
    # 将发件人的信息拆开
    name, addr = parseaddr(k)
    return formataddr((Header(name, 'utf-8').encode(), addr))

def send():
    # 163邮箱smtp服务器 smtp.163.com
    # qq邮箱smtp服务器 smtp.qq.com
    wy_server = ' '
    # sender_163为发件人的163号码
    sender_163 = ' '
    # pwd为163邮箱的授权码
    pwd = ' '
    # 收件人邮箱
    receivers = [' ']
    # 邮件的正文内容
    sender_163_mail = ' '
    mail_content = ' '
    # 邮件标题
    mail_title = '  '
    try:
        # SMTP发件服务器地址
        smtp = smtplib.SMTP_SSL(wy_server)
        # set_debuglevel()是用来调试的。参数值为1表示开启调试模式，参数值为0关闭调试模式
        smtp.set_debuglevel(1)
        smtp.ehlo(wy_server)
        smtp.login(sender_163, pwd)
        msg = MIMEText(mail_content, "plain", 'utf-8')
        msg["Subject"] = Header(mail_title, 'utf-8').encode()
        # 伪造一个地址前面的name
        msg["From"] = Header(" ", 'utf-8')  # 发送者
        # 伪造一个邮箱地址
        msg["From"] = __format_addr(" ")
        msg["To"] = __format_addr(receivers)
        smtp.sendmail(sender_163, receivers, msg.as_string())
        smtp.quit()
        return "success"
    except Exception as e:
        return "error"


if __name__ == "__main__":
    print(send())