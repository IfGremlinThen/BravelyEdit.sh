#!/bin/bash

#READS SAVE FILE YOU'D LIKE TO EDIT
echo "What is the save file you'd like to edit?"
echo "(enter 1, 2, or 3)"
read -r savefile
if [ "$savefile" -eq 1 ]; then
  savepath="$HOME/.var/app/org.citra_emu.citra/data/citra-emu/sdmc/Nintendo 3DS/00000000000000000000000000000000/00000000000000000000000000000000/title/00040000/000fc500/data/00000001/COLONY0.sav"
elif [ "$savefile" -eq 2 ]; then
  savepath="$HOME/.var/app/org.citra_emu.citra/data/citra-emu/sdmc/Nintendo 3DS/00000000000000000000000000000000/00000000000000000000000000000000/title/00040000/000fc500/data/00000001/COLONY1.sav"
elif [ "$savefile" -eq 3 ]; then
  savepath="$HOME/.var/app/org.citra_emu.citra/data/citra-emu/sdmc/Nintendo 3DS/00000000000000000000000000000000/00000000000000000000000000000000/title/00040000/000fc500/data/00000001/COLONY2.sav"
else
  echo "That is not a known save file." && exit
fi

#CHECKS WHETHER FILE EXISTS
if [ ! -f "$savepath" ]; then echo "Couldn't find $savepath." && exit; fi

#FETCHES CURRENT POPULATION COUNT
prehexcount=$(xxd -p -s 4 -l 1 "$savepath")
predeccount=$(echo "ibase=16; $prehexcount" | bc)
echo "Norende Village currently has $predeccount residents."

#READS THE DESIRED POPULATION COUNT IN DECIMAL
echo "How many Norende Village residents would you like?"
echo "(enter an integer between 0 and 256)"
read -r deccount
if [ "$deccount" -lt 1 ]; then
  echo "Norende's population cannot be lower than 1." && exit
elif [ "$deccount" -gt 255 ]; then
  echo "This script does not support populations greater than 255." && exit
fi

#CONVERTS DECIMAL TO HEXADECIMAL
hexcount=$(printf "%02X" "$deccount")

#VRITES HEXADECIMAL TO SAVE FILE
printf '%s' "$hexcount" | xxd -r -p | dd of="$savepath" bs=1 seek=4 count=1 conv=notrunc status=none
echo "Norende Village now has $deccount residents."


#LINUX CITRA BRAVELY DEFAULT COLONY SAVE LOCATION
#/home/user/.var/app/org.citra_emu.citra/data/citra-emu/sdmc/Nintendo 3DS/00000000000000000000000000000000/00000000000000000000000000000000/title/00040000/000fc500/data/00000001/COLONY0.sav
#/home/user/.var/app/org.citra_emu.citra/data/citra-emu/sdmc/Nintendo 3DS/00000000000000000000000000000000/00000000000000000000000000000000/title/00040000/000fc500/data/00000001/COLONY1.sav
#/home/user/.var/app/org.citra_emu.citra/data/citra-emu/sdmc/Nintendo 3DS/00000000000000000000000000000000/00000000000000000000000000000000/title/00040000/000fc500/data/00000001/COLONY2.sav
