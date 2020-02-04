#!/bin/bash    
gvim --servername GVIM --remote +$1 $2 ; xdotool search --name "/* - GVIM" windowactivate
