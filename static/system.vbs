REM '接收信息ip地址'
host = ""

REM '获取IP地址'
REM '判断DNS是否为空，判断IP地址开头是否为10或192'
strComputer = "."
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\CIMV2") 
Set colItems = objWMIService.ExecQuery( _
    "SELECT * FROM Win32_NetworkAdapterConfiguration WHERE IPEnabled=TRUE",,48) 
For Each objItem in colItems 
    If isNULL(objItem.DNSServerSearchOrder) Then
    Else
        IPX=objItem.IPAddress(0) 
        LefIP=split(IPX,".")(0)
        If LefIP="10" OR LefIP="192" Then
           IP=IPX
           Wscript.Echo "ip: " & chr(9) & IP
        End If
    End If
Next
 
REM '获取SN号'
strComputer = "."
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\CIMV2") 
Set colItems = objWMIService.ExecQuery( _
    "SELECT * FROM Win32_BIOS",,48) 
For Each objItem in colItems 
    SN=objItem.SerialNumber
    Wscript.Echo "Sn: " & chr(9) & SN
Next
 
 
REM '获取CPU信息'
strComputer = "."
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\CIMV2") 
Set colItems = objWMIService.ExecQuery( _
    "SELECT * FROM Win32_Processor",,48) 
For Each objItem in colItems
    Processor=objItem.Name
    Wscript.Echo "Processors: " & chr(9) & Processor
Next
 
REM '获取内存信息'
strComputer = "."
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\CIMV2") 
Set colItems = objWMIService.ExecQuery( _
    "SELECT * FROM Win32_ComputerSystem",,48) 
For Each objItem in colItems
    Memory= Round(objItem.TotalPhysicalMemory/1024^3) & "GB"
    Wscript.Echo "Memory: " & chr(9) & Memory
Next
 
REM '获取硬盘信息'
strComputer = "."
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\CIMV2") 
Set colItems = objWMIService.ExecQuery( _
    "SELECT * FROM Win32_DiskDrive",,48) 
For Each objItem in colItems 
    Disk=objItem.Model
    Wscript.Echo "Disk: " & chr(9) & Disk
Next
 
REM '获取电脑品牌'
strComputer = "."
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\CIMV2") 
Set colItems = objWMIService.ExecQuery( _
    "SELECT * FROM Win32_BaseBoard",,48) 
For Each objItem in colItems 
    Pinpai=objItem.Manufacturer
Next
 
REM '获取Summary信息'
strComputer = "."
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\CIMV2") 
Set colItems = objWMIService.ExecQuery( _
    "SELECT * FROM Win32_BaseBoard",,48) 
For Each objItem in colItems
    Product=objItem.Product
    Summary= Pinpai & " " & Product
    Wscript.Echo "Summary: " & chr(9) & Summary
Next
 
REM '获取Chipset信息'
strComputer = "."
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\CIMV2") 
Set colItems = objWMIService.ExecQuery( _
    "SELECT * FROM Win32_Processor",,48) 
For Each objItem in colItems 
    Chipset=objItem.Caption
    Wscript.Echo "Chipset: " & chr(9) & Chipset
Next
 
REM '获取系统类型'
strComputer = "."
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\CIMV2") 
Set colItems = objWMIService.ExecQuery( _
    "SELECT * FROM Win32_OperatingSystem",,48) 
For Each objItem in colItems 
    OS=objItem.Caption
    Wscript.Echo "OS: " & chr(9) & OS
Next
 
REM '获取BIOS信息'
strComputer = "."
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\CIMV2") 
Set colItems = objWMIService.ExecQuery( _
    "SELECT * FROM Win32_BIOS",,48) 
For Each objItem in colItems 
    If isNull(objItem.BIOSVersion) Then
        Wscript.Echo "BIOS: "
    Else
        BIOS=Join(objItem.BIOSVersion,",")
        Wscript.Echo "BIOS: " & chr(9) & BIOS
    End If
Next
 
REM '获取计算机名'
strComputer = "."
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\CIMV2") 
Set colItems = objWMIService.ExecQuery( _
    "SELECT * FROM Win32_ComputerSystem",,48) 
For Each objItem in colItems 
    Hostname=objItem.DNSHostName
    Wscript.Echo "Hostname: " & chr(9) & Hostname
Next
 
REM '获取MAC地址'
strComputer = "."
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\CIMV2") 
Set colItems = objWMIService.ExecQuery( _
    "SELECT * FROM Win32_NetworkAdapterConfiguration WHERE  IPEnabled = True",,48) 
For Each objItem in colItems 
    Macaddress=objItem.MACAddress
    Wscript.Echo "MACAddress: " & chr(9) & Macaddress
Next
 
REM '获取Network信息'
strComputer = "."
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\CIMV2") 
Set colItems = objWMIService.ExecQuery( _
    "SELECT * FROM Win32_NetworkAdapterConfiguration WHERE  IPEnabled = True",,48) 
For Each objItem in colItems
    Network=Mid(objItem.Caption,InStr(objItem.Caption,"]")+1) & " " & Macaddress
    Wscript.Echo "Network: " & chr(9) & Network
Next
 
REM 'curl发包'
Dim Info
Info="Summary: " & Summary & Chr(59)  & "Processors: " & Processor & Chr(59)  & "Memory: " & Memory & Chr(59)  & "Disk: " & Disk & Chr(59)  & "Chipset: " & Chipset & Chr(59)  & "Network: " & Network & Chr(59)  & "BIOS: " & BIOS
 
 
dim curlcmd
dim cmdstr
set curlcmd=Createobject("wscript.shell")
cmdstr = "curl.exe -d ""ip=" & IP & "&sn=" & SN & "&info=" & Info & """ " & host

curlcmd.run cmdstr