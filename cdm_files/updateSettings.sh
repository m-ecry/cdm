#!/bin/bash
#Version:221216a
#©omr-w
pfad=PLACEHOLDER
pfads="$pfad/data/settings"

#Value to change to
change=$1
#Which Parameter to change
sender=$2
#Which profile to change
profil=$3

function updateProfile {
    settings=$(grep -n "Profil::$profil" "$pfads")
    line="${settings%%:*}"
    
    line=$((line+offset))
    
    sed -i $line\d "$pfads"
    sed -i $line\i\ $change "$pfads"

    echo "Profile >$profil< changed. Current settings are:"
    tmp=$(grep -A 3 "Profil::$profil" "$pfads")
    out=()
    for line in $tmp; do
	out+=("$line")
    done
    label=(Profil Editor Terminal Filemanager)

    for i in $(seq 1 3); do
	printf "%-20.18s:%25.23s\n" ${label[$i]} ${out[$i]}
    done
}

function createProfile {
    profiles=$(grep "Profil::" "$pfads")

    for p in $profiles; do
	if [ "${p#*::*}" = "$profil" ]; then
	    echo "Error! Given Profile allready exists."
	    return 1
	fi
    done
    
    chain=(editor terminal filemanager)
    defaults=(atom xfce4-terminal thunar)
    printf "\nProfil::$profil\n">>"$pfads"
    ### Loops through chain, asking for defaults ###
    for i in $(seq 0 2); do
	echo "Please define default ${chain[$i]}. If none is choosen, default is set." 
	read -p ">>>   " chain[$i]
	if [ -z "${chain[$i]}" ]; then
	    chain[$i]=${defaults[$i]}
	fi
	echo "${chain[$i]}">>"$pfads"
    done
    
    printf "####">>"$pfads"
    cat $pfads
    cat $pfad/data/backup>$pfads
}


offset=0
case "$sender" in
    e | editor)
	offset=1
	updateProfile
	;;
    t | terminal)
	offset=2
	updateProfile
	;;
    f | filemanager)
	offset=3
	updateProfile
	;;
    c | create)
	createProfile
	;;
esac



exit 0
