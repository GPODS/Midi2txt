#!/bin/bash
# Author:
#	Sergi Vilardell <sergivilardell13@gmail.com >

OUTPUT=$HOME/"text-outputs"

if [ ! -d $OUTPUT ]; then
	mkdir $OUTPUT
fi

for FOLDER in */; do
	FNAME=${FOLDER// /_}
	FNAME=${FNAME%/}
	FILENAME="$OUTPUT/$FNAME.txt"
	echo "" > $FILENAME
	cd $FNAME && cat *.txt >> $FILENAME
	sed -i '/path/d' $FILENAME
	sed -i '/@/d' $FILENAME
	cd ..

done
