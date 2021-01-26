#!/bin/bash
packageName=$1
echo -e "start recording '$packageName' dump"

while [ 1 ];do
    pid=$(ps -A | grep $packageName | busybox awk '{print $2}')
    if [[ -z $pid ]];
    then
        echo -e "$packageName's process not exist!"
    else
        echo -e "$packageName's pid: $pid"
        folder=/sdcard/dump/$packageName/proc_$pid
        if [ ! -d "$folder" ];
        then
            echo mkdir -p $folder
            mkdir -p $folder
        fi
        datetime=`date +%Y%m%d%H%M%S`
        echo -e "current datetime is ${datetime}"

        echo -e "datetime: ${datetime} >>" >> $folder/ps_A_T_$pid.txt
        ps -A -T | grep -nri $pid >> $folder/ps_A_T_$pid.txt
        echo -e >> $folder/ps_A_T_$pid.txt

        echo -e "datetime: ${datetime} >>" >> $folder/proc_status_$pid.txt
        cat /proc/$pid/status >> $folder/proc_status_$pid.txt
        echo -e >> $folder/proc_status_$pid.txt

        echo -e "datetime: ${datetime} >>" >> $folder/proc_fd_$pid.txt
        ls -l /proc/$pid/fd >> $folder/proc_fd_$pid.txt
        echo -e >> $folder/proc_fd_$pid.txt
        

        echo -e "datetime: ${datetime} >>" >> $folder/dumpsys_meminfo_$pid.txt
        dumpsys meminfo -a $pid >> $folder/dumpsys_meminfo_$pid.txt
        echo -e >> $folder/dumpsys_meminfo_$pid.txt
        

        echo -e "datetime: ${datetime} >>" >> $folder/proc_meminfo.txt
        cat /proc/meminfo >> $folder/proc_meminfo.txt
        echo -e >> $folder/proc_meminfo.txt
        

    fi
    sleep 2
done