#!/usr/bin/env bash

# get percent line. split by ;, then by spaces
percent=$(pmset -g batt | grep % | awk -F ';' '{print $1}' | awk -F ' ' '{print $3}')

# get the remaining estimated time
remain=$(pmset -g batt | grep % | perl -pe "s/^.*\((no estimate)\).*$/\1/")
if [ "$remain" == "no estimate" ] ; then
    remain='no est'
elif pmset -g batt | grep "not charging" > /dev/null ; then
    remain='not charging'
else
    remain=$(pmset -g batt | grep % | perl -pe "s/^.* (\d+:\d\d) remaining.*$/\1/")
fi

source=$(pmset -g batt | grep "drawing from" | perl -pe "s/^.*from '(.+) Power'$/\1/")
if [ "$source" == "Battery" ] ; then
    source_icon="b";
    remain_suffix="remain";
elif [ "$source" == "AC" ] ; then
    source_icon="p";
    remain_suffix="till full";
fi

remain_part="($remain $remain_suffix)"
if [ "$percent" == "100%" ] && [ "$remain" == "0:00" ] ; then
    remain_part="(full)"
elif [ "$remain" == "not charging" ] ; then
    remain_part="($remain)"
fi

if [ "$DEBUG" ] ; then
    echo "pmset line=$(pmset -g batt | grep %)"
    echo "percent=$percent"
    echo "remain=$remain"
    echo "remain_suffix=$remain_suffix"
    echo "remain_part=$remain_part"
    echo "source=$source"
    echo "source_icon=$source_icon"
fi

# limit total length
if [ ${#percent} -gt 10 ] ; then
    percent='?%'
fi

echo "$source_icon $percent $remain_part"
