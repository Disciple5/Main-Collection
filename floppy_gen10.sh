#!/bin/bash
#
# Copyright 2014 - Disciple
# http://www.JesusFreak.co.uk/ - http://www.JesusChatRoom.com/
#
# License: LGPL v3
###############################################################

f="1";
img=$RANDOM;
while [ $f -le 10 ] # Pack of 10 IBM formatted floppy diskette's.
do	
		echo "Floppy creation NUM: $f";
		f=$(( f+1 ));
	if [ ! -f "$img" ]; then
		dd bs=512 count=2880 if=/dev/urandom of="dir/$RANDOM.img";
	fi
	for floppy in $(find . -iname '*.img'); do
	    echo "Writing fat32 to floppy.";
	    mkfs.msdos $floppy;
	done
done
