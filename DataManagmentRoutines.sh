#!/bin/bash

##rename all files with random names
for d in */
do
	for file in $d*
	do
		filename="$(basename $file)"
		mv "$file" $d$RANDOM-"$filename"
  		#mv "$file" $RANDOM-"$file"
	done
done

##convert .jpeg tp png
for d in */
do
	for i in $d*.jpeg
	do
		convert "$i" "${i%.*}.png"
		rm -rf $i
	done
done

##Rename all files in sequence
for d in */ ; do
	a=1
	for i in $d*.png; do
  		new=$(printf "%d.png" "$a") #04 pad to length of 4
		#echo "$i" $d"$new"
  		mv -i -- "$i" $d"$new"
  		a=$((a+1))
	done
done





