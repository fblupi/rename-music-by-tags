#!/usr/bin/env python
import os
import sys
import eyed3
import unicodedata

# function to remove accents
def remove_accents(s):
   return ''.join(c for c in unicodedata.normalize('NFD', s)
                  if unicodedata.category(c) != 'Mn')

# function to change a string tag into a printable string tag
def get_ascii_tag(t):
    t = remove_accents(t) # remove accents
    t = t.encode('ascii', errors = 'ignore') # remove non-ascii characters
    t = t.lower() # to lower
    return t

# checking input
if len(sys.argv) != 2:
    print 'use: python renameMusicByTags.py <file>'
    sys.exit(1)

input_file = sys.argv[1]

if not input_file.endswith('.mp3'):
    print 'input file must have mp3 extension'
    sys.exit(1)


if not os.path.isfile(input_file):
    print input_file, 'not found'
    sys.exit(1)

# loading tags
audio_file = eyed3.load(input_file)

artist = 'unknown'
album = 'unknonw'
title = 'unknown'

# getting elements of new file name
if audio_file.tag.artist != None:   # tag not null
    artist = audio_file.tag.artist  # get artist
    artist = get_ascii_tag(artist)  # get printable string

if audio_file.tag.album != None:    # tag not null
    album = audio_file.tag.album    # get album
    album = get_ascii_tag(album)    # get printable string

if audio_file.tag.title != None:    # tag not null
    title = audio_file.tag.title    # get title
    title = get_ascii_tag(title)    # get printable string

# generating new file name
directory = os.path.dirname(os.path.realpath(input_file))
new_name = '%s/%s - %s - %s.mp3' % (directory, artist, album, title)

# renaming file
os.rename(input_file, new_name)
print 'File: ' + input_file + '\nRenamed as: ' + new_name + '\n'
