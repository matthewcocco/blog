#!/bin/bash

# By Rob Groen 0ctober 2014 info@robgroen.nl
#
# Resize pictures (*.jpg|JPG) and put them in a new create directory (if not excist)
# Script needs to be executed in the dir above ./Picture if the
# pictures are in /home/rob/MyDocs/Pictures place the script in
# like /myDocs an run bash resize.sh   (**** Use bash NOT sh *****)


OIFS="$IFS"
IFS=$'\n'
COUNT=1
for IN in `find ~/code/blog/assets/images/posts/003/trier/originals -iname "*.jpg" -o -iname "*.png"`
do
OUT="resized/$IN"
DIR=$(dirname $OUT)
mkdir -p "$DIR"
if [ ! -f $OUT ]; then
echo "$COUNT Converting $IN"
convert $IN -resize 1600  $OUT
else
echo "$COUNT Skip $IN converted already."
fi

COUNT=$[COUNT + 1]
done
IFS="$OIFS"
