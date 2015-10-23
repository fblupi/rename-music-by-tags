#!/bin/bash
if [[ $# != 1 ]] ; then
  echo "use: sh renameMusicByTags.sh <file>"
  exit 1
fi

if [[ $1 != *.mp3 && $1 != *.m4a ]] ; then
  echo "input file must have mp3 or m4a extension"
  exit 1
fi

if ! [[ -f $1 ]] ; then
  echo "$1 not found"
  exit 1
fi

ARTIST=$(mp3info -p %a $1)
ALBUM=$(mp3info -p %l $1)
SONG=$(mp3info -p %t $1)

# To lowercase
ARTIST=${ARTIST,,}
ALBUM=${ALBUM,,}
SONG=${SONG,,}

# Get File Extension
EXTENSION=$(echo $1|awk -F . '{print $NF}')

# Get Name
NAME="$ARTIST - $ALBUM - $SONG.$EXTENSION"

# Rename
mv $1 "$NAME"
