#!/bin/bash -x

### hideously inefficient script; but it doesn't need to be ;)
### uses rofi
con_id="$( i3-get-window-id.sh )"
if [[ -n "${con_id}" ]]
then 

  i3-msg "[con_id=${con_id}] focus"

fi
