#!/bin/bash
# Authors:
#	Sergi Vilardell <sergivilardell13@gmail.com >
#	Alfredo Hernández <aldomann.designs@gmail.com>
#	Alejandro Jiménez <aljrico@gmail.com>

OUTPUT=$HOME/"smf2txt-outputs"

if [ ! -d $OUTPUT ]; then
	mkdir $OUTPUT
fi

# For files in parent folder
function parent {
	for FILE in *.mid; do
		NAME=${FILE##*/}
		NAME=${NAME%.mid}
		array=($NAME)
		FNAME=${array[0]}
		NAME=${NAME// /_}

		OUTPUT=$HOME/"smf2txt-outputs"/$FNAME
			if [ ! -d $OUTPUT ]; then
				mkdir $OUTPUT
			fi

		smf2txt -f "%o #o %p %d #d %c %t" "$FILE" > "$OUTPUT"/"$NAME".txt
	done
}

# For files in subfolders
function children {
	for FOLDER in */; do
		for FILE in "$FOLDER"*.mid; do
			FNAME=${FOLDER// /_}
			FNAME=${FNAME%/}
			NAME=${FILE##*/}
			NAME=${NAME%.mid}
			NAME=${NAME// /_}
			OUTPUT=$HOME/"smf2txt-outputs"/$FNAME
			if [ ! -d $OUTPUT ]; then
				mkdir $OUTPUT
			fi
			smf2txt -f "%o #o %p %d #d %c %t" "$FILE" > "$OUTPUT"/"$FNAME"-"$NAME".txt
		done
	done
}

parent
children
