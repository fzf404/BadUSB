# Badusb Server

> 插入后执行某些特定操作 🍳

## 文件结构

```bash
BadUSB
├── badusb
│   └── badusb.ino   # ardunio program
├── static
│   ├── index.html   # home page
│   └── system.vbs   # execute program when insert usb
├── README.md        # readme
├── requirements.txt # python requirments
└── upload.py        # server
```

## 使用

> 首先将信息写入代码中

```bash
# 1. 使用 ArduinoLeonardo 烧录程序, 首次烧录前短接 RST 与 GND

# 2. 安装依赖
pip install -r requirements.txt

# 3. 运行服务端
python3 Upload.py

# 4. 后台运行
nohup python3 upload.py &
```

## TODO

> 接入阿里云物联网平台
