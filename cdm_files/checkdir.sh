#!/bin/bash
#Version:221216a
#©omr-w
<<<<<<< HEAD
pfad=$HOME/.utils
=======
pfad=/home/paul/.utils
>>>>>>> e336bf1... Removed profiles in favor of envars for the prefered programs launching; Added some install feedback
### Set identifier to marker (first argument without "-" in front ###
identifier=$1

if [ -z $1 ]; then
    exit 1
fi

dir=NULL
marklist=$(grep :: "$pfad/data/mark.txt")

for line in $marklist; do
    if [ "$identifier" = "${line%*::*}" ]; then
	dir="${line#*::*}"	  
    fi
done

if [ "$dir" = NULL ]; then
    echo "No Marker exists with given identifier. List identifiers with 'cdm -l'."
    echo "For complete List with identifiers and links enter 'cdm -la'."
    exit 1
else
    echo "$dir" #to handle passed test to main script#
    exit 0
fi

