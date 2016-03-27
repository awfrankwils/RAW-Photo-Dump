#!/bin/bash
echo
echo
echo
echo 'Weclome to the Frank-Wilson Photo-Dumper V1.0'
echo
echo "       Created by Andrew Frank-Wilson"
echo
echo

###This script is intented to move RAW image files into a network attached storage drive, which needs to be mounted. 
#To set NAS mount, call shell script with path "./NASmount.sh" this file contains "mkdir /Volumes/MyShare; mount_afp afp://username:password@192.168.1.25/ShareName /Volumes/MyShare"

#Set directory to Location of ./NASmount.sh
cd ~/Documents/MoveRAW/
#Call mount script
./NASmount.sh
###

#Set to Photo Storage Directory 'Camera Raw' (for testing, the testdir)
#cd /volumes/home/Camera\ RAW/2016/Feb\ Monuments/testdir
cd /volumes/home/Camera\ RAW/

echo "The current Photo Storage Directory is: "
pwd
echo
echo "The current Source Directory is: "
echo /volumes/NIKON\ D5300/DCIM/100D5300/
#/volumes/home/Camera\ RAW/testcard/
echo
echo "What would you like to call this shoot?: "
read eventname


#for all RAW files that exist in the memory card directory
#cd /volumes/home/Camera\ RAW/testcard/
cd /volumes/NIKON\ D5300/DCIM/100D5300/
IFS=$'\n' 
for fname in *.NEF
do #checks that the NEF file has a size, and then reads the date info and generates a year variable for that photograph.  
	[ -s $fname ] && year=$(exiftool -d '%Y' -DateTimeOriginal $fname|cut -c 35-) 
#function that makes a directory and change directory into it. Call by 'mcd'. 
#cd /volumes/home/Camera\ RAW/2016/Feb\ Monuments/testdir
cd /volumes/home/Camera\ RAW/
mcd() { mkdir -p "$1"; cd "$1";}
#Create a folder with a year matching the date the photo was taken and change directory into it...
mcd $year
#Create folder with event name specified by the user and change directory into it...
mcd $eventname
#idea here was to test the 'photo created on date' with the $year variable for eligibility to be moved into new working directory.
#if cd /volumes/home/Camera\ RAW/testcard/ && [ `exiftool -d '%Y' -DateTimeOriginal $fname|cut -c 35-` = "$year" ] 
	#then 
	#cd /volumes/home/Camera\ RAW/2016/Feb\ Monuments/testdir/$year/$eventname/
	#mv /volumes/home/Camera\ RAW/testcard/$fname .
	#cd /volumes/home/Camera\ RAW/testcard/
	#fi
if cd /volumes/NIKON\ D5300/DCIM/100D5300/ && [ `exiftool -d '%Y' -DateTimeOriginal $fname|cut -c 35-` = "$year" ] 
then 
	cd /volumes/home/Camera\ RAW/$year/$eventname/
	mv /volumes/NIKON\ D5300/DCIM/100D5300/$fname .
	cd /volumes/NIKON\ D5300/DCIM/100D5300/
fi
done
echo
echo "Dump Complete :)"
echo
echo