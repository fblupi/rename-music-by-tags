#!/bin/bash
if [[ $# != 1 ]] ; then
  echo "use: ./renameMusicInADirectory.sh <directory>"
  exit 1
fi

for i in "$1"*; do
  if [[ $i == *.mp3 ]] ; then
    $(python rename_music_by_tags "$i")
  fi
done
