# Rename Music by Tags

## Description

If you're an obsessively tidy person like me you'll want to have all your music organized and it will annoy you having every music file name with a different criteria. Rename your music files by using its artist, album name and song name tags.

## Instructions

### Shell version

#### Requirements

* Install mp3info if not installed: `sudo apt-get install mp3info`

#### Use

##### Convert single file

* Convert any mp3 file: `./renameMusicByTags.sh <file>`

##### Convert multiple files

* Convert every mp3 files from a directory: `./renameMusicInADirectory <directory>` (Directory must finish on backslash "/". For example `./renameMusicInADirectory ~/MyMusic/RockAndRollCompilation/`)

### Python version

#### Requirements

* Install python if not installed: `sudo apt-get install python`
* Install pip if not installed: http://pip.readthedocs.org/en/stable/installing/ (Python 2.7.9 and later on python2 series and Python 3.4 and later include pip by default).
* Install eyed3 if not installed: `pip install eyed3`

#### Use

##### Convert single file

* Convert any mp3 file: `python rename_music_by_tags.py <file>`

##### Convert multiple files

* Convert every mp3 files from a directory: `python rename_music_in_a_directory.py <directory>` (Directory must finish on backslash "/". For example `python rename_music_in_a_directory.py ~/MyMusic/RockAndRollCompilation/`)
