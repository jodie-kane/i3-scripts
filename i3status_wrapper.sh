#!/bin/bash

# format command output with required boilerplate 
function status_format(){

 name="${1}"; shift

 full_text="$( ${@} )"

 echo -n "{\"name\":\"${name}\",\"full_text\":\"${full_text}\"},"

}

# i3status header
echo "{\"version\":1}"
echo "["

# main loop -- prefix cutstom command output to i3status output
i3status | while :
do

  read i3s
  gret=$( echo "${i3s}" | grep "name"  )
  if [[ "x${gret}" != "x" ]]
  then 

    i3s="${i3s#,[}"
    echo -n "["
    
    #add items here: status_format "name" command [args...]
    status_format "pom"     pom         # pom := phase of the moon
    status_format "battery" batstat.sh  # battery status script; e.g., '⭷ 69%'

    echo -n "${i3s},"
  fi

done
