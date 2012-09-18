#!/bin/sh

java -cp lib/jgroups.jar -Djava.net.preferIPv4Stack=true org.jgroups.tests.McastReceiverTest -mcast_addr 224.10.10.10 -port 5555


