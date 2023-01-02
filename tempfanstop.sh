#! /bin/bash
echo $1 > /sys/class/gpio/$0/subsystem/unexport 
