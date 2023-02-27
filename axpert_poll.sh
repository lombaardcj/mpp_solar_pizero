#!/bin/sh
/usr/local/bin/mpp-solar -p /dev/ttyUSB0 -o mqtt --mqttbroker <mqtt.broker.ip> --mqttuser mqtt --mqttpass <pass> -c QPIGS#QPIRI -n <inverter_name>
sleep 1
/usr/local/bin/mpp-solar -p /dev/ttyUSB0 -o influx2_mqtt --tag influx2/mpp_axpert --mqttbroker <mqtt.broker.ip> --mqttuser mqtt --mqttpass <pass> -c QPIGS#QPIRI
