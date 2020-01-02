#!/bin/sh
# _   _                 ____                            _   
#| | | |___  ___ _ __  |  _ \ _ __ ___  _ __ ___  _ __ | |_ 
#| | | / __|/ _ \ '__| | |_) | '__/ _ \| '_ ` _ \| '_ \| __|
#| |_| \__ \  __/ |    |  __/| | | (_) | | | | | | |_) | |_ 
# \___/|___/\___|_|    |_|   |_|  \___/|_| |_| |_| .__/ \__|
#                                                |_|        
#Script to check for confirmation from the user before 
#running any command passed
#arg1 -> Prompt Message, arg2 -> Command to be run
#
#Dependencies -> dmenu.

response=$(echo -e "Yes\nNo" | dmenu -i -p "$1" -l 2)
[ "$response" = "Yes" ] && $2  

