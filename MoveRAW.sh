#!/bin/bash
echo
echo
echo
echo 'Weclome to the Frank-Wilson Photo-Dumper V1.0'
echo
echo "       Created by Andrew Frank-Wilson"
echo
echo
#Set to Photo Storage Directory 'Camera Raw' (for testing, the testdir)
cd /volumes/home/Camera\ RAW/2016/Feb\ Monuments/testdir

echo "The current Photo Storage Directory is: "
pwd
echo
echo "The current Source Directory is: "
echo /volumes/home/Camera\ RAW/testcard/
echo
echo "What would you like to call this shoot?: "
read eventname


#for all RAW files that exist in the memory card directory
for fname in *.NEF
do
	[ -s $fname ] && year=$(exiftool -d '%Y' -DateTimeOriginal $fname|cut -c 35-) 
mcd() { mkdir -p "$1"; cd "$1";}
mcd $year
mcd $eventname
fi
done