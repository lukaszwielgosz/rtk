#!/bin/bash
#cd ~/RTKLIB/app/str2str/gcc
#sudo ./str2str -in serial://ttyAMA0:230400#ubx -out tcpsvr://:666

path="/home/pi/gnss/"

# find unused file name
i=0
fname=$path"base_station"$i".ubx"
while [ -f $fname ]; do
     let "i=i+1"
     fname=$path"base_station"$i".ubx"
done

fname=$path"base_station"$i".ubx"

# start task to collect base_station data at 5 Hz
str2str -in serial://ttyAMA0:230400#ubx -out tcpsvr://:666 -out $fname -c     home/pi/gnss/m8t_base_5hz.cmd

# check for error by looking for output file
sleep 1
ls $fname
if [ $? -ne 0 ]
then
     echo Exit on error
     exit
fi
