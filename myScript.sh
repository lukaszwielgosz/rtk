#!/bin/bash

path="/home/pi/gnss/"

# find unused file name
i=0
fname=$path"rover"$i".ubx"
while [ -f $fname ]; do
     let “i=i+1”
     fname=$path"rover"$i".ubx"
done

fname=$path"rover"$i".ubx"

echo $fname
