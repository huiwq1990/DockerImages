
http://blog.yaodataking.com/2016/01/docker-myimagefirst.html


4.build镜像
 docker build -t huiwq1990/mycat .
 
5.启动容器
 docker run -i -t -p 8080:8080 -p 9066:9066 -p 8066:8066 -p 81:80 huiwq1990/mycat /bin/bash
 
 启动服务
```
 cd ~
 sh startup.sh
```

其他主机mysql访问8066，9066端口
mysql -umycatuser -pmycatpass -h192.168.199.111 –P8066

mysql -umycatuser -pmycatpass -h192.168.199.111 –P9066






