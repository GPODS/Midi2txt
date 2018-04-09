#!/bin/bash
# Authors:
#	Sergi Vilardell <sergivilardell13@gmail.com >
#	Alfredo Hernández <aldomann.designs@gmail.com>
#	Alejandro Jiménez <aljrico@gmail.com>

output_folder=$HOME/"Bach-midi2text"

shopt -s globstar
for file in **/*.mid; do
	echo $file
	name=${file##*/}
	name=${name%.mid}
	name=${name// /_}
	IFS='/' read -ra array <<< "$file"
	fname=${array[0]}
	output=$output_folder/$fname
		if [ ! -d $output ]; then
			mkdir $output
		fi
	smf2txt -f "%o #o %p %d #d %c %t" "$file" > "$output"/"$name".txt;
done
