#!/bin/bash

#Not tested, Just works with cmus
#Add IP to kodi-send
#programs that output audio
number=$(fuser /dev/snd/controlC0 | wc -w)

if [[ "$number" = "0" ]]; then
  exit
fi

elif [[ "$number" = "1" ]]; then
        #Get the PID of the programs
 	pid=$(basename -a $(fuser /dev/snd/controlC0))
 	
        #Get their command name
        name=$(basename -a $(ls -l /proc/$pid/exe | cut -d ' ' -f 12 ))
  
	if [[ "$name" = "cmus" ]]; then  
		cmus-remote -c -U
	fi

	if [[ "$name = "kodi-x11" ]]; then
		kodi-send --host=192.168.1.XX --port=9777 --action='pause'
        fi
else
	kodi-send --host=192.168.1.XX --port=9777 --action='pause'
	cmus-remote -c -U
	
