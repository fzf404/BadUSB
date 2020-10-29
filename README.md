# Badusb Server

> 插入后执行某些特定操作🍳

## 文件结构

```powershell
# 标🎈代表需要自行修改信息
:.
│  README.md
│  requirements.txt     # 所需python库
│  🎈Upload.py            # 服务端程序
│
├─badusb
│      🎈badusb.ino       # Arduino文件
│
└─static
        index.html      # 主页
        🎈SystemInfo.vbs  # Badusb插入后运行的特定程序

```

## 使用

> 首先将编辑信息写入代码中

```pwoershell
# 安装Flask与yagmail
pip install -r requirements.txt
# 测试运行
python3 Upload.py

```

