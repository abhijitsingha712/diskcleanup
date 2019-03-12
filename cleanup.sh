#!/bin/bash

echo " Before Cleaning up" > /root/custom_script/output.txt
df -Ph / >> /root/custom_script/output.txt

CURRENT=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')
THRESHOLD=70

if [ "$CURRENT" -gt "$THRESHOLD" ] ; then
    find /usr/local/airflow/logs/scheduler/* -type d -mtime +3 -exec rm -r {} +  && find /var/log/hadoop/hdfs/hdfs-audit* -type f -mtime +4 -delete
fi

echo "After cleaning the required files" >> /root/custom_script/output.txt
df -Ph / >> /root/custom_script/output.txt

echo 'script run at' `date` >> /root/custom_script/output.txt


