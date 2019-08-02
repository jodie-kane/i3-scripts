#!/bin/bash 

### hideously inefficient script; but it doesn't need to be ;)
### uses rofi

#get window list
windows="$( i3-workspace-window-list.sh )"

# separate the con_ids
con_ids=( $( echo "${windows}" | cut -d'|' -f 1 ) )

# get the index of our window of choice
# "rofi -i" == return index of selected
index=$( echo "${windows}" | cut -d'|' -f2,4- | column -s'|' -t | \
         rofi -font 'mono 14' -dmenu -no-custom -location 1 -width 55% -format i -p 'winlist: ')

# if we don't select anything above, $index is unset
# and "unset -eq 0", so we set a default
if [[ ${index:--1} -ge 0 ]]
then

  #use that index to get con_id
  echo "${con_ids[${index}]}"

fi
