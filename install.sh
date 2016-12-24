#!/bin/bash
#Version: 221216a
#©omr-w
#Datastructure for full install:
#.utils: checkdir.sh, gotomark.sh, setmark.sh, updateSettings.sh
#.utils/data/: mark.txt, settings

pfad="$HOME/.utils"
regexp="PLACEHOLDER"

for file in $(find cdm_files/*.sh); do
    sed -i "s%$regexp%$pfad%g" $file #*.sh #"$PWD/cdm_files/*"
done

if [ ! -d "$pfad" ]; then
    mkdir "$pfad"
    mkdir "$pfad/data"
elif [ ! -d "$pfad/data" ]; then
    mkdir "$pfad/data"
fi

targetScript=(checkdir.sh gotomark.sh setmark.sh updateSettings.sh)
targetData=(settings)
for i in $(seq 0 3); do
    cp cdm_files/${targetScript[$i]} "$pfad/${targetScript[$i]}"
    chmod +x "$pfad/${targetScript[$i]}"
done

for i in $(seq 0 0); do
    cp cdm_files/${targetData[$i]} "$pfad/data/${targetData[$i]}"
done

echo "default::$HOME">"$pfad/data/mark.txt"
echo "">>"$pfad/data/mark.txt"

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

#ToDo: Einstellungsdatei, geleitete Installation




