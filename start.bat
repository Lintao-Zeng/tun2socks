@echo off

rem adb�˿�ת��
set fport=
set /p fport=������˿ںţ�
adb forward tcp:%fport% tcp:%fport%
adb forward --list

rem ������������ΪĬ��·��
route delete 0.0.0.0 mask 0.0.0.0
route add 0.0.0.0 mask 0.0.0.0 10.0.0.1 metric 6

rem route add 127.0.0.1 192.168.0.1 metric 5
rem ���������ǽ�������������������͵�ԭ�������أ����������ֻ������������������ͺ͵���������ͬһ�����磬����û�б�Ҫʹ�ã���������������������ͬҲû�б�Ҫʹ�á�

rem ����tun2socks��%~dp0��ȡ��ǰ�ľ���·��
echo ���Ӵ����������127.0.0.1:%fport%
%~dp0tun2socks-windows-4.0-amd64.exe -tunAddr 10.0.0.2 -tunGw 10.0.0.1 -proxyType socks -proxyServer 127.0.0.1:%fport% -dnsServer 8.8.8.8,8.8.4.4

pause
