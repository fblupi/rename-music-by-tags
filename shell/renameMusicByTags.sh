#!/bin/bash
if [[ $# != 1 ]] ; then
  echo "use: ./renameMusicByTags.sh <file>"
  exit 1
fi

if [[ $1 != *.mp3 ]] ; then
  echo "input file must have mp3 extension"
  exit 1
fi

if ! [[ -f $1 ]] ; then
  echo "$1 not found"
  exit 1
fi

ARTIST="unknown"
ALBUM="unknown"
SONG="unknown"

# Check tags
if [[ $(mp3info -p %a "$1") ]] ; then
  ARTIST=$(mp3info -p %a "$1")
  ARTIST=$(echo $ARTIST|sed -f changes.sed) # Change some special characters
  ARTIST=${ARTIST//[^[:ascii:]]/} # Remove non ascii characters
  ARTIST=${ARTIST,,} # To lowercase
fi

if [[ $(mp3info -p %l "$1") ]] ; then
  ALBUM=$(mp3info -p %l "$1")
  ALBUM=$(echo $ALBUM|sed -f changes.sed) # Change some special characters
  ALBUM=${ALBUM//[^[:ascii:]]/} # Remove non ascii characters
  ALBUM=${ALBUM,,} # To lowercase
fi

if [[ $(mp3info -p %t "$1") ]] ; then
  SONG=$(mp3info -p %t "$1")
  SONG=$(echo $SONG|sed -f changes.sed) # Change some special characters
  SONG=${SONG//[^[:ascii:]]/} # Remove non ascii characters
  SONG=${SONG,,} # To lowercase
fi

# Get Name
NAME="$ARTIST - $ALBUM - $SONG.mp3"

# Rename
mv "$1" "$(dirname "$1")"/"$NAME"
