#!/usr/bin/env python
import os
import sys
import subprocess

# checking input
if len(sys.argv) != 2:
    print 'use: python renameMusicByTags.py <file>'
    sys.exit(1)

input_directory = sys.argv[1]

for root, dirs, files in os.walk(input_directory):
    for f in files:
        if f.endswith('.mp3'):
            subprocess.call([sys.executable, 'rename_music_by_tags.py', input_directory + f])
