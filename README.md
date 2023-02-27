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

Add the following to the file:
Refer to - https://github.com/lombaardcj/mpp_solar_pizero/blob/main/axpert_poll.sh
- 

# Setup CRON job to run every minute
- `crontab -e`

Add the following line to call the shell
`* * * * * /home/pi/axpert_poll.sh`
