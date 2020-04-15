#!/bin/bash
###############################
# created by : SJ
# Description : Script to assess quality value of items in a prominent inn. 
# History : Created on 14th April 202
###############################

set -x
args=("$@")
if [ -z "$args" ]
    then
        echo Usage : $0 \"item_name\" \"item_expiry\" \"item_quality\"
        echo Example : $0 \"sumit test\" \"10\" \"38\" 
        exit 1
    fi

item_name=${args[0]}
item_expiry=${args[1]}
item_quality=${args[2]}

# Loop for accessing quality for items which are either "Aged Brie" or "Conjured" or any other items except for "Backstage passes", "Sulphuras".

for (( i=0; i<=$item_expiry ; i++ )) 
   do
      if [[ "$item_quality" -le 50 && "$item_quality" -ge 0 ]] 
        then
            if [ "$item_name" = "Aged Brie" ]
               then
                   item_quality=$(($item_quality + 1)) 
                   #echo $i, $item_quality 
               else 
                   if [ "$item_name" = "Conjured" ]
                     then
                         item_quality=$(($item_quality - 2))
                     else    
                         if [[ "$item_name" != "Backstage passes" && "$item_name" != "Sulphuras" ]]
                          then
                              item_quality=$(($item_quality - 1)) 
                              #echo $i, $item_quality 
                         fi
                   fi   
             fi
        fi
    done

# Loop for accessing quality for "Backstage passes" item

if [ "$item_name" = "Backstage passes" ]
  then
      if [ "$item_expiry" -gt 10 ]
        then
            item_quality=$(($item_quality + 1))
        else
            if [[ "$item_expiry" -le 10 && "$item_expiry" -gt 5 ]]
              then
                  item_quality=$(($item_quality + 2))
              else
                  if [[ "$item_expiry" -le 5 && "$item_expiry" -gt 0 ]]
                    then
                        item_quality=$(($item_quality +3))
                    else
                        item_quality=0 
                  fi
           fi
      fi
 fi

 # Equation for "Sulphuras".
 if [ "$item_name" = "Sulphuras" ]                 
   then
      item_quality=80
 fi
#EndOfScript
