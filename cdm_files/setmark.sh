#!/bin/bash
#Version:221216a
#©omr-w
pfad=PLACEHOLDER
pfadm="$pfad/data/mark.txt"
pfads="$pfad/data/settings"

if [ -z "$1" ]; then
    line=$(grep "default::*" "$pfadm")
    if [ "${line#*::*}" = "$PWD" ]; then
	echo "Current directory is allready marked as default."
	exit
    fi
    
    echo "Reset default Marker from ${line#*::*} to $PWD?"
    select yn in "Yes" "No"; do
	case $yn in
	    Yes ) echo "${line#*::*} is now reachable by default."; break;;
	    No ) echo Exiting without changes.; exit;;
	esac
    done
    ### Default löschen und neu insert (default immer auf line 1 ###
    sed -i "1d" "$pfadm"
    sed -i "1i default::$PWD" "$pfadm"

else
    if [ -n "$2" ]; then
	echo "Warning! Spaces are not accepted, identifier to store: $1"
    fi
    linenumber=1
    for line in $(grep :: $pfad/data/mark.txt); do
	if [ "${line%*::*}" = "$1" ]; then
	    echo "Replace allready exisiting Marker with link to ${line#*::*}?"
	    select yn in "Yes" "No"; do
		case $yn in
		    Yes ) echo "${line#*::*} is now reachable with command 'cdm $1.'"; break;;
		    No ) echo Exiting without changes.; exit;;
		esac
	    done
	    sed -i "$linenumber"d "$pfadm" #Um unique zu löschen löschen über line#
	elif [ "${line%*::*}" != "default" ]; then
	    if [ "${line#*::*}" = "$PWD" ]; then
		echo "Relink allready marked location? (Current Link: ${line%*::*})"
		select yn in "Yes" "No"; do
		    case $yn in
			Yes ) echo "${line#*::*} is now reachable with command 'cdm $1.'"; break;;
			No ) echo Exiting without changes.; exit;;
		    esac
		done
		sed -i "$linenumber"d "$pfadm"
	    fi
	fi
	linenumber=$((linenumber+1))
    done
    echo "$1::$PWD">>"$pfadm" #~/skripte/.utils/data/mark.txt
fi


