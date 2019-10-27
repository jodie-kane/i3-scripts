#!/bin/bash 

## TODO: perhaps give user option to list tabbed "root" also? 

i3_tree="$( i3-msg -t get_tree )"

# output pipe delimited text 
windows="$( 
  echo ${i3_tree} | jq -jc \
  '.nodes[].nodes[].nodes[] | 
      select( .type == "workspace") as $works | 
        ( 

          $works.nodes[], 
          $works.nodes[].nodes[],
          $works.floating_nodes[].nodes[],
          $works.floating_nodes[].nodes[].nodes[]
          

        ) as $wins |

        select( $wins.window_properties != null ) |

        $wins.id, "|",
        "[", $works.num, "]|", 
        $wins.focused, "|",
        $wins.window_properties.class, "|", 
        $wins.window_properties.title,  

        "\n"'
)"

# to make the workspace numbers line up
# i.e., single column, we map:
# [-1] => [S] :: scratchpad
# [10] => [0] :: it's also actually the key on the keyboard ;)

echo "${windows}" | sed -e 's/|\[-1\]|/|[S]|/' -e 's/|\[10\]|/|\[0\]|/' 
