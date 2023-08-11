# BDPopEdit.sh
A simple bash script for editing your Norende Village population count in Bravely Default under Citra.

<p align=center><img src="https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white">  <img src="https://img.shields.io/badge/Atom-66595C?style=for-the-badge&logo=Atom&logoColor=white">  <img src="https://img.shields.io/badge/Linux_Mint-87CF3E?style=for-the-badge&logo=linux-mint&logoColor=white"></p>
<p align=center>Written in <b>Bash 5.1</b>. Edited in <b>Atom 1.59</b>. Tested on <b>Linux Mint 21.2</b>.</p>

The purpose of this script is to restore functionality to the Norende Village feature in <a href="https://en.wikipedia.org/wiki/Bravely_Default">Bravely Default</a> when emulated under <a href="https://github.com/citra-emu/citra">Citra</a>.  Norende Village is a reward system in Bravely Default that progressively unlocks items and customization options for the player as residents of Norende Village complete the repair of various buildings over time.  The player only begins with 1 resident with the expectation that they will collect more via the Nintendo 3DS's StreetPass feature or by using the Update Data option at Save Points.  Both options require you to either be in regular proximity to another 3DS with physical hardware or to connect to Nintendo's 2012 servers, neither of which are achievable via modern emulation.

The majority of building repairs take a prohibitively long time to complete with just 1 resident, with some jobs requiring the game be open for as long as *99 hours*, however each additional resident assigned to a job significantly reduces the time it takes to complete, so this script serves to manually edit the number of residents in Norende Village.

***Warning!:*** *This script currently only supports editing save data created under Citra running on a Linux-based operating system.  BACKUP YOUR SAVE FILE before making edits.*

## Save Editing
Download the script and run the following Terminal command from the same directory:
```
bash bdpopedit.sh
```
In the Terminal you will be prompted to enter the save file you wish to edit (1, 2, or 3) and then enter your desired number of residents.  The script currently only accepts integers from 1 to 255.

The script will `exit` if
- you specify an invalid save file
- the specified save file doesn't exist
- you request a population count lower than 1
- you request a population count greater than 255

The script will inform you of your save file's population count before and after making edits.

## How does it work?
Your Norende Village save data is contained in one of three hidden files called COLONY#.sav.  The Norende Village population count is stored in two hexadecimal bytes located at 0x4 & 0x5.  BDPopEdit.sh reads your chosen save slot as a filepath then takes a decimal integer from you and converts it to hexadecimal before writing it to the file.

## Important Notes
Some useful information to bear in mind regarding Norende Village save data editing:
- Norende Village save data is created as soon as you start a new save file.
- Norende Village becomes available in-game after defeating Barras Lehr and Holly White for the first time.

***Warning!:*** *The effects of decreasing an existing population count while you have residents assigned to jobs is currently UNTESTED.*

### Personal
This is my first "romhack"!  I'm aware that there are some GUI save editors floating around out there for Windows, but I wanted to see if I could make a simple shell script that specifically fixed the population issue in Norende Village on Linux.  With some feedback I should be abe to expand it's functionality to work on more platforms or even edit other in-game values.  The main obstacle is knowing where the information is stored.
