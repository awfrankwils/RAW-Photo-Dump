#!/bin/bash
echo "Weclome to the Frank-Wilson Photo-Dumper V1.0"
echo "Created by Andrew Frank-Wilson"
#Set to Photo Storage Directory 'Camera Raw'
cd /volumes/home/Camera\ RAW/2016/Feb\ Monuments/testdir
echo
echo "The current Photo Storage Directory is: "
pwd
echo "What would you like to call this shoot?: "
read eventname

for fname in *.NEF
do
	[ -s $fname ] && year=$(exiftool -d '%Y' -DateTimeOriginal $fname|cut -c 35-) 
#function that makes a directory and cds into it. call by mcd. 
mcd() { mkdir -p "$1"; cd "$1";}
mcd $year
#Create Folder with event name and change directory into it...
mcd $eventname
mv /volumes/home/Camera\ RAW/2016/Feb\ Monuments/testdir/*.NEF .
done