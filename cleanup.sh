
#!/bin/bash
CURRENT=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')
THRESHOLD=75

if [ "$CURRENT" -gt "$THRESHOLD" ] ; then
    find /usr/local/airflow/logs/scheduler/* -type d -mtime +3 -exec rm -r {} + && find /var/log/hadoop/hdfs/hdfs-audit* -type f -mtime +3 -delete
fi 
