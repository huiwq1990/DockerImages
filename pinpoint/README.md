
## pull docker images

for i in `seq 10000`; do  docker pull yous/pinpoint:1.0.4 ; done


## run

docker run -i -t --cap-add SYS_PTRACE --security-opt apparmor:unconfined yous/pinpoint bash




## build mine

docker build -i -t huiwq1990/pinpoint .

docker run -d --net=host -e HBASE_HOST=<HOST_IP> -e HBASE_PORT=2181 -e COLLECTOR_TCP_PORT=9994 -e COLLECTOR_UDP_STAT_LISTEN_PORT=9995 -e COLLECTOR_UDP_SPAN_LISTEN_PORT=9996 -p 9994:9994 -p 9995:9995/udp -p 9996:9996/udp --name=pinpoint-collector pinpoint-collector