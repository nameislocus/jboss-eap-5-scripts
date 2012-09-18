#!/bin/sh

. ./env.sh

$JBOSS_HOME/bin/shutdown.sh -s jnp://localhost:1099 -u admin -p admin -S
