#!/bin/bash
MOTIONCONF=/etc/motion/motion.conf
MOTIONDIR=' sudo grep "^target_dir" $MOTIONCONF | awk '{ print $2}''
if [ ! -d $MOTIONDIR ]; then
	mkdir $MOTIONDIR
 	chown motion $MOTIONDIR
fi
LISTFILES='find $MOTIONDIR -maxdepth 1 -type f | grep jpg$'
NUMFILES='find $MOTIONDIR -maxdepth 1 -type f | grep jpg$ | wc -l'
LASTCOUNT=0
while true
do
        LISTFILES=('find $MOTIONDIR -maxdepth 1 -type f | grep jpg$')
        NUMFILES='find $MOTIONDIR -maxdepth 1 -type f | grep jpg$ | wc -l'
        ITERATOR=0
        while [ $LASTCOUNT -lt $NUMFILES ];
        do
                IMAGEFILE=${LISTFILES[$ITERATOR]}
                echo -e "Warning,\nAn intruder was detected at 'date'\nPlease see the image attached for details" \
                | mutt –F /root/.muttrc \
                -s "[INTURDER ALERT] Intruder Detected" \
                -a $IMAGEFILE -- <your email> LASTCOUNT='expr $LASTCOUNT + 1' ITERATOR='expr $ITERATOR + 1' done sleep 1
done
