
http://blog.yaodataking.com/2016/01/docker-myimagefirst.html


4.build����
 docker build -t huiwq1990/mycat .
 
5.��������
 docker run -i -t -p 8080:8080 -p 9066:9066 -p 8066:8066 -p 81:80 huiwq1990/mycat /bin/bash
 
 ��������
```
 cd ~
 sh startup.sh
```

��������mysql����8066��9066�˿�
mysql -umycatuser -pmycatpass -h192.168.199.111 �CP8066

mysql -umycatuser -pmycatpass -h192.168.199.111 �CP9066






