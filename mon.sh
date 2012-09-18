#!/bin/sh

. ./env.sh


#To get the active session count for your own app.
$JBOSS_HOME/bin/twiddle.sh --user=admin --password=admin --server=jnp://localhost:1099 get jboss.web:type=Manager,path=/jmx-console,host=localhost activeSessions

#To retrieve the thread queue size
$JBOSS_HOME/bin/twiddle.sh --user=admin --password=admin --server=jnp://localhost:1099 get jboss.system:service=ThreadPool QueueSize

#To retrieve active thread counts
$JBOSS_HOME/bin/twiddle.sh --user=admin --password=admin --server=jnp://localhost:1099 get jboss.system:type=ServerInfo ActiveThreadCount

#To retrieve the amount of free memory
$JBOSS_HOME/bin/twiddle.sh --user=admin --password=admin --server=jnp://localhost:1099 get jboss.system:type=ServerInfo FreeMemory

#To get all processing stats from the HTTP acceptor on JBoss
$JBOSS_HOME/bin/twiddle.sh --user=admin --password=admin --server=jnp://localhost:1099 get jboss.web:type=GlobalRequestProcessor,name=http-0.0.0.0-8080

#Invoke a thread dump
$JBOSS_HOME/bin/twiddle.sh --user=admin --password=admin --server=jnp://localhost:1099 invoke jboss.system:type=ServerInfo listThreadDump 

#Invoke a listing of CPU utilization
$JBOSS_HOME/bin/twiddle.sh --user=admin --password=admin --server=jnp://localhost:1099 invoke jboss.system:type=ServerInfo listThreadCpuUtilization

