#!/bin/bash

# kodi-send --host=192.168.1.33 --port=9777 --action='pause'
#cmus-remote -c -U

#programs
number=$(fuser /dev/snd/controlC0 | wc -w)
echo "$number"

if [[ "$number" = "0" ]]; then
  echo ""
fi

elif [[ "$number" = "1" ]]; then
	echo "this"
 	pid=$(basename -a $(fuser /dev/snd/controlC0))
 	name=$(basename -a $(ls -l /proc/$pid/exe | cut -d ' ' -f 12 ))
	echo "$name"  

	if [[ "$name" = "cmus" ]]; then
		echo "good"    
		cmus-remote -c -U
	fi

	elif [[ "$name = "kodi-x11" ]]; then
		kodi-send --host=192.168.1.33 --port=9777 --action='pause'
#	fi
#else
#fi
#elif [[ "$number" >= "2" ]]; then
#	kodi-send --host=192.168.1.33 --port=9777 --action='pause'
#	cmus-remote -c -U
	
fi
