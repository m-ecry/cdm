#!/bin/bash
#Version: 221216a
#©omr-w
#Datastructure for full install:
#.utils: checkdir.sh, gotomark.sh, setmark.sh, updateSettings.sh
#.utils/data/: mark.txt, settings

pfad="$HOME/.utils"
regexp="PLACEHOLDER"

<<<<<<< HEAD
if [ ! -d "$pfad" ]; then
    mkdir "$pfad"
    mkdir "$pfad/data"
elif [ ! -d "$pfad/data" ]; then
    mkdir "$pfad/data"
fi
=======
#if Kram ersetzt, da -p kürzer
mkdir -p "$pfad/data"
>>>>>>> e336bf1... Removed profiles in favor of envars for the prefered programs launching; Added some install feedback

targetScript=(checkdir.sh gotomark.sh setmark.sh)
for i in $(seq 0 2); do
    cp cdm_files/${targetScript[$i]} "$pfad/${targetScript[$i]}"
    chmod +x "$pfad/${targetScript[$i]}"
    echo "Copying '${targetScript[$i]}' to '$pfad/${targetScript[$i]}'"
done

echo ""
echo "default::$HOME">"$pfad/data/mark.txt"
echo "">>"$pfad/data/mark.txt"

<<<<<<< HEAD
#muss noch geprüft werden, ob alte Version schon da
tmp=$(grep cdm $HOME/.bash_aliases)
if [ -z "$tmp" ]; then
    echo alias\ mark=\"$pfad/setmark.sh\">>"$HOME/.bash_aliases"
    echo alias\ cdm=\". $pfad/gotomark.sh\">>"$HOME/.bash_aliases"
    source $HOME/.bash_aliases
else
    #remove old alias
    sed -i.bak '/cdm/d' "$HOME/.bash_aliases"
    sed -i '/mark/d/' "$HOMA/.bash_aliases"

    echo alias\ mark=\"$pfad/setmark.sh\">>"$HOME/.bash_aliases"
    echo alias\ cdm=\". $pfad/gotomark.sh\">>"$HOME/.bash_aliases"
    source $HOME/.bash_aliases
fi
=======
echo "Updating $HOME/.bash_aliases"
>>>>>>> e336bf1... Removed profiles in favor of envars for the prefered programs launching; Added some install feedback

#warning if ~/.bash_aliases didnt exist, to remember user to source it
if [ ! -f ~/.bash_aliases ] ; then
    printf "\033[31m
Be aware to source '~/.bash_aliases' in your ~/.bashrc like this

<<<<<<< HEAD
<<<<<<< HEAD
echo '_cdm() 
{ 
    local cur opt 
    COMPREPLY=() 
=======
echo '_cdm()
{
    local cur opt
    COMPREPLY=()
>>>>>>> 5a3a937... Replaced tabs with spaces, cleaned up text
    cur="${COMP_WORDS[COMP_CWORD]}"   # das aktuell geschriebene Argument
    pre="${COMP_WORDS[COMP_CWORD-1]}" # das vorherige Argument

    # Completion of benchmark commands
    # der erste Parameter ist das Benchmark
    if [[ $COMP_CWORD == 1 ]]; then
        # wenn es mehrere Benches zu Namen gibt kompletiere
        COMPREPLY=( $(compgen -W "$(cdm -ls
            )" "$cur" ) )
    return 0
    fi
} &&
complete -F _cdm cdm
' >> ~/.bashrc

source ~/.bashrc
<<<<<<< HEAD
=======
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
>>>>>>> e336bf1... Removed profiles in favor of envars for the prefered programs launching; Added some install feedback

if [ -z "$EDITOR" ]; then
    printf "\033[33mNo standard editor set. \nPlease set envvar EDITOR if you want to use -e or -w flag like \n\n\t echo export EDITOR='/usr/bin/atom' >> $HOME/.bash_aliases\n\n\033[0m"
else
    printf "\033[32mStandard editor is set as envvar EDITOR to $EDITOR \n\033[0m"
fi

if [ -z "$FILEMANAGER" ]; then
    printf "\033[33mNo standard filemanager set. Please set envvar FILEMANAGER if you want to use -f or -w flag like: \n\n\t echo export FILEMANAGER='/usr/bin/thunar' >> $HOME/.bash_aliases\n\n \033[0m"
else
    printf "\033[32mStandard filemanager is set as envvar FILEMANAGER to $FILEMANAGER \n\033[0m"
fi

source $HOME/.bash_aliases
=======
>>>>>>> 5a3a937... Replaced tabs with spaces, cleaned up text
