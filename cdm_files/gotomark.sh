#!/bin/bash
#Version:221216a

pfad="$HOME/.utils"
pfadm="$pfad/data/mark.txt"

if [ -z "$1" ]; then
    ### Wenn keine Argumente beigefügt, wechsel zu default dir ###
    dir=$(head -n 1 "$pfadm")
    dir="${dir#*::*}"
    cd $dir
    return 0
fi

while true; do
    case "$1" in
    -h | --help)
        ### Help him!
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
            $EDITOR .&
            $FILEMANAGER .&
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
