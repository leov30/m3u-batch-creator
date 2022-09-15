# m3u-batch-creator
batch script to create m3u files for retroarch
will work only for playsation 1? with "(Disc #)" in the file name. this script is based of this tutorial:
https://docs.retroachievements.org/Multi-Disc-Games-Tutorial/

just drag and drop a file or folder to the script and it will crteate the m3u file. the script depends on the (Disc #) tag in the file name. the script will delete an existing m3u file with the same name if found.

if folder is drag and drop, will add all .cue files in that folder

for individual file, m3u file will be inside the game folder, and m3u list will have direct paths  "game.cue" 

for folder, m3u will be ouside of game folder, and m3u list will have the path for the game folder "gamefolder\game.cue"

------------------------
recursive folder mode:

just run the script and the script will go thru every folder, and will make m3u files for every folder on that directory...

recursive file mode:

just run the script in a folder with .cue files from many games, and script will create m3u files based of (Disc #) for every single game




