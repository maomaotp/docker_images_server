#!/bin/bash
if (($#==0));then
     echo "./docker_enter.sh containId"
     exit
fi

sudo nsenter --target `docker inspect --format {{.State.Pid}} $1` --mount --uts --ipc --net --pid bash
