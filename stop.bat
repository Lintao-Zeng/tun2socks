rem 恢复原本的默认路由
route delete 0.0.0.0 mask 0.0.0.0 10.0.0.1 metric 6
rem 192.168.0.1是你当前连接的网络网关
route add 0.0.0.0 mask 0.0.0.0 192.168.0.1 metric 6
rem 移除adb端口转发
adb forward --remove-all
adb forward --list
rem 查看当前路由表
netstat -nr
pause
