# cdm
Version 221216a
©omr-w

cdm is a tool for the terminal, that adds two new commands to the terminal in order to navigate fast between common places on the disk.
- mark ALIAS: Marks the current directory with an ALIAS, allowing via cdm ALIAS to return to that place. If no ALIAS is given, the default marker is set. Consequently, there is allways one default marker and many other markers.  
- cdm ALIAS: Returns to a previous marked position. If no ALIAS is given, goes to the default location, also costumizeable. By passing the option -w ALIAS one can create a workspace at the target Directory, consisting of an filemanager (default: thunar) and an editor (default: atom) 

For Installation are needed following files:
- install.sh
- in subdirectory "cdm_files":
  - checkdir.sh
  - gotomark.sh
  - setmark.sh
  - settings
  - updateSettings.sh

Install with terminal. Open Terminal in directory, where is the install.sh file. Execute with command:
bash install.sh

The script will do the rest.

You can now use cdm as the following:

Mark a directory with the command "mark ALIAS". When no ALIAS is given, default marker is set.
After marking a directory You can return to this directory by calling in the terminal
"cdm ALIAS" Again, if no ALIAS is given it will return to the directory, marked as default.
As this is bash, please don't use any special characters or space for the alias.

Also there are some options, callable with cdm:

* -l | --list : List all stored ALIAS.
* -la | --listall: List all stored ALIAS and the directories, they are linked to.
* -w ALIAS | --workspace ALIAS: Change directory to linked dir and builds on the linked directory a workspace consisting of an editor and a filemanager.
* -e PARAM: Set the default editor, used for building the Workspace. (default: atom)
