#!/bin/bash 

con_id="$( ***REMOVED***i3-get-window-id.sh )"

if [[ -n "${con_id}" ]]
then 

  i3-msg "[con_id=${con_id}]" "${@:-focus}"

fi
