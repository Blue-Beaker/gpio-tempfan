# Simple GPIO Temperature Fan Service

A simple temperature-controlled fan service for linux devices with gpio, like single board computers. Turns fan on when temperature is higher than thresold, off otherwise.  
一个简易的温控风扇服务，用于单板机等有GPIO的linux设备。当温度高于阈值时打开风扇，反之关闭。  

Modify parameters in the scripts and service file according to your enviornment before using. The default configuration is for Orangepi Zero with PG06 as control pin.  
使用前请先根据你的环境修改脚本和服务文件的参数。默认配置是用于Orangepi Zero并使用PG06作为风扇控制引脚。  

The tempfan.service can be copied into /etc/systemd/system and run as a systemd service unit:  
可以将tempfan.service复制到/etc/systemd/system作为一个systemd服务单元运行:  
```
sudo cp tempfan/tempfan.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable tempfan --now
```

An example circuit is provided in example_pcb folder. The circuit is quite simple that you can even solder it on a 3\*3 universal circuit board.  
example_pcb文件夹提供示例电路。该电路非常简单，可以在3\*3洞洞板上焊接。