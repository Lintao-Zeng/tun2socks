@echo off

rem adb端口转发
set fport=
set /p fport=请输入端口号：
adb forward tcp:%fport% tcp:%fport%
adb forward --list

rem 设置虚拟网卡为默认路由
route delete 0.0.0.0 mask 0.0.0.0
route add 0.0.0.0 mask 0.0.0.0 10.0.0.1 metric 6

rem route add 127.0.0.1 192.168.0.1 metric 5
rem 这条命令是将代理服务器的流量发送到原来的网关，但是由于手机（代理服务器）本身就和电脑连接了同一个网络，所以没有必要使用；如果代理服务器和网关相同也没有必要使用。

rem 启动tun2socks，%~dp0获取当前的绝对路径
echo 连接代理服务器：127.0.0.1:%fport%
%~dp0tun2socks-windows-4.0-amd64.exe -tunAddr 10.0.0.2 -tunGw 10.0.0.1 -proxyType socks -proxyServer 127.0.0.1:%fport% -dnsServer 8.8.8.8,8.8.4.4

pause
