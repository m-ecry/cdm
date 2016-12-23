#!/bin/bash
#Version: 221216a
#©omr-w
#Datastructure for full install:
#.utils: checkdir.sh, gotomark.sh, setmark.sh, updateSettings.sh
#.utils/data/: mark.txt, settings

pfad="$HOME/.utils"
regexp="PLACEHOLDER"

#if Kram ersetzt, da -p kürzer
mkdir -p "$pfad/data"

targetScript=(checkdir.sh gotomark.sh setmark.sh)
for i in $(seq 0 2); do
    cp cdm_files/${targetScript[$i]} "$pfad/${targetScript[$i]}"
    chmod +x "$pfad/${targetScript[$i]}"
    echo "Copying '${targetScript[$i]}' to '$pfad/${targetScript[$i]}'"
done

echo ""
echo "default::$HOME">"$pfad/data/mark.txt"
echo "">>"$pfad/data/mark.txt"

echo "Updating $HOME/.bash_aliases"

#warning if ~/.bash_aliases didnt exist, to remember user to source it
if [ ! -f ~/.bash_aliases ] ; then
    printf "\033[31m
Be aware to source '~/.bash_aliases' in your ~/.bashrc like this

    if [ -f ~/.bash_aliases ]; then
        source ~/.bash_aliases
    fi

to have this tool working!\033[0m"
fi

#if replaced, touch is shorter
touch $HOME/.bash_aliases
echo "alias mark=$pfad/setmark.sh">>"$HOME/.bash_aliases"
echo "alias cdm=$pfad/gotomark.sh">>"$HOME/.bash_aliases"
echo ""

if [ -z "$EDITOR" ]; then
    printf "\033[33mNo standard filemanager set. \nPlease set envvar FILEMANAGER if you want to use -f or -w flag like \n\n\t echo export FILEMANAGER='/usr/bin/thunar' >> $HOME/.bash_aliases\n\n\033[0m"
else
    printf "\033[32mStandard editor is set as envvar EDITOR to $EDITOR \n\033[0m"
fi

if [ -z "$FILEMANAGER" ]; then
    printf "\033[33mNo standard filemanager set. Please set envvar FILEMANAGER if you want to use -f or -w flag like: \n\n\t echo export EDITOR='/usr/bin/atom' >> $HOME/.bash_aliases\n\n \033[0m"
    export FILEMANAGER="/usr/bin/thunar"
else
    printf "\033[32mStandard filemanager is set as envvar FILEMANAGER to $FILEMANAGER \n\033[0m"
fi

source $HOME/.bash_aliases
