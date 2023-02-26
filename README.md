# mpp_solar_pizero

- Install pizero with latest rasbian OS - Lite
- Install pip: `sudo apt-get install pip`
- Install mppsolar `sudo pip install mppsolar`

# Testing the mppsolar is working
- Plug USB to Serial into PiZERO
- Find device name `ls /dev/tty*`
- Usually `/dev/ttyUSB0`
- Run mpp-solar connecting through the USB port listed for example `mpp-solar -p /dev/ttyUSB0 -c QPIGS`
- This queries the inverter using PI30 protocol on standard BAUD 2400 to retrieve the Inverter Status Information

# create a shellscript and add the mpp-solar commands to run into the file
- `touch /home/pi/axpert_poll.sh`
- `chmod +x /home/pi/axper_poll.sh`
- `nano /home/pi/axper_poll.sh`

ADd the following to the file:
```
#!/bin/sh
#Get Serial number of inverter
/usr/local/bin/mpp-solar -p /dev/ttyUSB0 -o mqtt --mqttbroker 192.168.1.105 --mqttuser <user> --mqttpass <password> -c QPID
sleep 1

#Get current status
/usr/local/bin/mpp-solar -p /dev/ttyUSB0 -o mqtt --mqttbroker 192.168.1.105 --mqttuser <user> --mqttpass <password> -c QPIGS
sleep 1

#Get current config settings
/usr/local/bin/mpp-solar -p /dev/ttyUSB0 -o mqtt --mqttbroker 192.168.1.105 --mqttuser <user> --mqttpass <password> -c QPIRI
```

- 

# Setup CRON job to run every minute
- `crontab -e`

Add the following line to call the shell
`* * * * * /home/pi/axpert_poll.sh`
