#!/bin/bash -x

### hideously inefficient script; but it doesn't need to be ;)
### uses rofi

# could actually be: i3-window-apply.sh focus
# or even just:      i3-window-apply.sh 
# or technically, deleted in favour of the above ;)
con_id="$( i3-get-window-id.sh )"
if [[ -n "${con_id}" ]]
then 

  i3-msg "[con_id=${con_id}] focus"

fi
