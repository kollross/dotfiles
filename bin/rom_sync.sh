#!/bin/sh

cd ~/iCloud/ROMS/RP5/ROMs
find . -name .DS_Store -exec rm -v {} \;
rsync -arvpP --delete  ~/iCloud/ROMS/RP5/ROMs/ /Volumes/RP5/ROMs/
###rsync -arvpP --delete  ~/iCloud/ROMS/RP5/BIOS/ /Volumes/RP5/BIOS/
cd /Volumes/RP5
find . -name \*._\* -exec rm -v {} \;
