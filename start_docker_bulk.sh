#!/bin/sh

START_NUM=10
END_NUM=30

PORT_DNS=53
PORT_RNDC=953
LISTFILE=started_conid.lst
KILL_SCRIPT=kill_docker_bulk.sh


PORT_PREFIX=`seq $START_NUM  $END_NUM`
#echo $PORT_PREFIX


for AAA in $PORT_PREFIX
do
    echo [$AAA"53"]  [$AAA"953"]
    #echo "docker run --cap-add=ALL  -d -p $AAA"53":53/udp -p $AAA"53":53/tcp -p $AAA"953":953/tcp  bind-dev:p2"
    docker run --cap-add=ALL  -d -p $AAA"53":53/udp -p $AAA"53":53/tcp -p $AAA"953":953/tcp  bind-dev:p2-new 1>> $LISTFILE
done

sed -e 's/^/docker stop  /'  $LISTFILE | awk '{print $1, $2, $3" && docker rm ", $3}'  > $KILL_SCRIPT
rm -f $LISTFILE
