#!/bin/bash
# Authors:
#	Sergi Vilardell <sergivilardell13@gmail.com>
#	Alfredo Hernández <aldomann.designs@gmail.com>

OUTPUT=$HOME/"text-outputs"

if [ ! -d $OUTPUT ]; then
	mkdir $OUTPUT
fi

for FOLDER in */; do
	FNAME=${FOLDER// /_}
	FNAME=${FNAME%/}
	FILENAME="$OUTPUT/$FNAME.txt"
	touch $FILENAME
	cd $FNAME && cat *.txt >> $FILENAME
	sed -i '/path/d' $FILENAME
	sed -i '/@/d' $FILENAME
	cd ..

done
