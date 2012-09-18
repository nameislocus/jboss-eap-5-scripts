#!/bin/sh

DATE=`date +%Y%m%d%H%M%S`

. ./env.sh

PID=`ps -ef | grep java | grep "=$SERVER_NAME" | awk '{print $2}'`
echo $PID

if [ e$PID != "e" ]
then
    echo "JBoss SERVER - $SERVER_NAME is already RUNNING..."
    exit;
fi

#UNAME=`id -u -n`
#if [ e$UNAME != "ejboss" ]
#then
#    echo "Use jboss account to start JBoss SERVER - $SERVER_NAME..."
#    exit;
#fi

echo $JAVA_OPTS
  
mv $SERVER_NAME.out ./nohup/$SERVER_NAME.out$DATE
nohup $JBOSS_HOME/bin/run.sh -b $BIND_ADDR -Dserver=$SERVER_NAME -Djboss.server.base.dir=$SERVER_HOME -Djboss.server.base.url=file://$SERVER_HOME -c $SERVER_NAME -g $PARTITION_NAME -u $MULTICAST_ADDR >> $SERVER_NAME.out &


if [ e$1 = "enotail" ]
then
    echo "Starting... $SERVER_NAME"
    exit;
fi

tail -f log/server.log
