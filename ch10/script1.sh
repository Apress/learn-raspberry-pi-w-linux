#!/bin/bash
MOTIONCONF=/etc/motion/motion.conf
MOTIONDIR=' sudo grep "^target_dir" $MOTIONCONF | awk '{ print $2}''
if [ ! -d $MOTIONDIR ]; then
	mkdir $MOTIONDIR
	chown motion $MOTIONDIR
fi
LISTFILES=('find $MOTIONDIR -maxdepth 1 -type f | grep jpg$')
NUMFILES=' find $MOTIONDIR -maxdepth 1 -type f | grep jpg$ | wc -l'
if [ $NUMFILES -gt 0 ]; then
        for IMAGEFILE in $LISTFILES
        do
                echo -e "Warning,\nAn intruder was detected at 'date'\nPlease see the image attached for details" \
                | mutt -s "[INTURDER ALERT] Intruder Detected" \
                –F /root/.muttrc \
                -a $IMAGEFILE -- <your email>
                rm $IMAGEFILE
        done
fi
