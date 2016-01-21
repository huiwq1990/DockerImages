
http://blog.yaodataking.com/2016/01/docker-myimagefirst.html


4.build镜像
#docker build -t myimage/first .
build 完毕，我们可以看到image
#docker images
2016-01-01_23-36-21
5.启动容器
docker create –name mycontainer01 -p 8080:8080 -p 8066:8066 -p 9066:9066 myimage/first
docker start mycontainer01
docker exec -it mycontainer01 /bin/bash


其他主机mysql访问8066，9066端口
mysql -umycatuser -pmycatpass -h192.168.199.111 –P8066

mysql -umycatuser -pmycatpass -h192.168.199.111 –P9066






 docker build -t huiwq1990/mycat .