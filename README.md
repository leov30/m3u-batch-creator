# m3u-batch-creator
batch script to create m3u files for retroarch
will work only for playsation 1? with "(Disc \#)" in the file name. this script is based of this tutorial:
https://docs.retroachievements.org/Multi-Disc-Games-Tutorial/
supports .cue, .chd

will also rename files, and create m3u for retropie, the option _pie=0, needs to be set to '1' inside the scipt
https://retropie.org.uk/docs/Playstation-1/

# usage

** draggin and droping a folder will add every .cue, or .chd to a single mp3u file, so this is good if games already separeded by folders.
** for games in folders the path inside the m3u will have the same path as the folder

just drag and drop a file or folder to the script and it will create the m3u file. the script depends on the (Disc \#) tag in the file name.

the script will delete an existing m3u file with the same name if found. if a folder its draged and drop, the script will add all .cue/.chd files in that folder, the path in the m3u file will be set to the folder path also.

* recursive folder mode /recursive file mode:

just run the script and it  will make m3u files for every game found in that direcotry, will also scan all the folders and make m3u for each folder.




