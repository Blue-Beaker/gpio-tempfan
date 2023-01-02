#! /bin/bash
echo $2 > /sys/class/gpio/$1/subsystem/unexport 
