
http://blog.yaodataking.com/2016/01/docker-myimagefirst.html


4.build����
#docker build -t myimage/first .
build ��ϣ����ǿ��Կ���image
#docker images
2016-01-01_23-36-21
5.��������
docker create �Cname mycontainer01 -p 8080:8080 -p 8066:8066 -p 9066:9066 myimage/first
docker start mycontainer01
docker exec -it mycontainer01 /bin/bash


��������mysql����8066��9066�˿�
mysql -umycatuser -pmycatpass -h192.168.199.111 �CP8066

mysql -umycatuser -pmycatpass -h192.168.199.111 �CP9066






 docker build -t huiwq1990/mycat .