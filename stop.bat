rem �ָ�ԭ����Ĭ��·��
route delete 0.0.0.0 mask 0.0.0.0 10.0.0.1 metric 6
rem 192.168.0.1���㵱ǰ���ӵ���������
route add 0.0.0.0 mask 0.0.0.0 192.168.0.1 metric 6
rem �Ƴ�adb�˿�ת��
adb forward --remove-all
adb forward --list
rem �鿴��ǰ·�ɱ�
netstat -nr
pause
