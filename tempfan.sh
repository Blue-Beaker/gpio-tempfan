#! /bin/bash

gpiochip='gpiochip0' # gpiochip for the GPIO
offset='198' # GPIO line offset
thresold=50000 # The tempture to start fan. For example 50000 is 50.000°C
poststop='/home/pi/tempfan/tempfanstop.sh' # point to tempfanstop.sh
sensor='/sys/class/thermal/thermal_zone0/hwmon0/temp1_input' # point to your temperature sensor value

if [ $# -ge 1 ]
then
    if [ $1 = 'stop' ]
    then
        echo $offset > /sys/class/gpio/$gpiochip/subsystem/unexport
        exit
    fi
fi
echo $offset > /sys/class/gpio/$gpiochip/subsystem/export
echo out > /sys/class/gpio/$gpiochip/subsystem/gpio$offset/direction
echo 0 > /sys/class/gpio/$gpiochip/subsystem/gpio$offset/active_low

state=-1
trap "$0 stop;exit" 1 2 3 15
echo "Started tempfan with Thresold "$thresold
while true
do
    temp=$(cat $sensor)
    if [ $temp -ge $thresold ]
    then
        if [ $state != 1 ]
        then
        echo "Temp:"$temp" > Thresold:"$thresold", Fan ON"
        echo 1 > /sys/class/gpio/$gpiochip/subsystem/gpio$offset/value
        state=1
        fi
    else
        if [ $state != 0 ]
        then
        echo "Temp:"$temp" < Thresold:"$thresold", Fan OFF"
        echo 0 > /sys/class/gpio/$gpiochip/subsystem/gpio$offset/value
        state=0
        fi
    fi
    sleep 0.5s
done
