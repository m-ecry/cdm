#!/bin/bash
#Version:221216a
#©omr-w

pfad="$HOME/.utils"
pfadm="$pfad/data/mark.txt"

if [ -z "$1" ]; then
    ### Wenn keine Argumente beigefügt, wechsel zu default dir ###
    dir=$(head -n 1 "$pfadm")
    dir="${dir#*::*}"
    cd $dir
    return 0
fi

while :
do
    case "$1" in
	-h | --help)
	    ### Help him!
	    break
	    return 0
	    ;;
	-l | --list)
	    echo "Available Marks are (-la reveals linked dir):"
	    for line in $(grep -v default "$pfadm"); do
		echo "${line%*::*}"
	    done
	    shift 1
	    ;;
	-ls | --list-silent)
	    for line in $(grep -v default "$pfadm"); do
		echo "${line%*::*}"
	    done
	    shift 1
	    ;;
	-la | --listall)
	    cat "$pfadm"
	    break
	    ;;
<<<<<<< HEAD
	-p | --profile)
	    ### Change current profile ###
	    ## Check for valid profile ##
	    profile=$2
	    profiles=$(grep "Profil::" "$pfads")
	    valid=0
	    if [ -z "$profile" ]; then
		profile="default"
	    fi
	    for p in $profiles; do
		if [ "${p#*::*}" = "$profile" ]; then
		    valid=1
		    break
		fi
	    done
	    if [ $valid = 0 ]; then
		echo "No profile with this name exists!"
		break
	    fi
	    sed -i "1d" "$pfads"
	    sed -i "1i $profile" "$pfads"
	    echo "Current profile set to $profile."
	    break
	    ;;
	-t | --terminal)
	    ### Set default terminal in current profile. Default: xfce4-terminal. Terminal Position in Settings: +2 ###
	    ### Edit: Actually seems like a dump idea, kept but not relevant###
	    "$pfad/updateSettings.sh" "$2" t "$profil"
	    shift 2
	    ;;
	-w | --workspace)
	    ### cd to dir and build workspace there, consisting of editor, filemanager and terminal. ###
	    ### check for valid marker ###
	    check=$("$pfad/checkdir.sh" $2)
	    if [ -n "${check%%/*}" ]; then
		### Print Error Message and exit ###
		echo "$check"
		break
	    else
		cd "$check"
      	settings=$(grep -A 3 "Profil::$profil" "$pfads")
		tmp=()
		for line in $settings; do
		    tmp+=("$line")
		done
		tmp2="${tmp[0]}"
		echo "Current profile set to: ${tmp2#*::*}."
		${tmp[1]} .&
		${tmp[3]} .&
		break
	    fi
	    shift 2
	    ;;
	-*)
	    ### Caches errors in Option ###
	    echo "Error! Unknown Option $1."
	    break
	    ;;
	*)
	    check=$("$pfad/checkdir.sh" $1)
	    if [ -z "${check%%/*}" ]; then
		cd "$check"
	    else
		### Print error Message and exit. ###
		echo "$check"
	    fi
	    break
	    ;;
    esac
done
