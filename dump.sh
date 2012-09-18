#!/bin/sh

. ./env.sh 

ps -ef | grep java | grep "$SERVER_NAME " | awk {'print "kill -3 " $2'} | sh -x
