# get percent line. split by ;, then by spaces
perc=`pmset -g batt | grep % | awk -F ';' '{print $1}' | awk -F ' ' '{print $3}'`

# get the remaining estimated time
remain=`pmset -g batt | grep % | perl -pe "s/^.*\((no estimate)\).*$/\1/"`
if [ "$remain" == "no estimate" ] ; then
    remain='no est'
else
    remain=`pmset -g batt | grep % | perl -pe "s/^.*(\d:\d\d) remaining.*$/\1/"`
fi

source=`pmset -g batt | grep "drawing from" | perl -pe "s/^.*from '(.+) Power'$/\1/"`
if [ "$source" == "Battery" ] ; then
    source_icon="b ";
    remain_suffix="remain";
elif [ "$source" == "AC" ] ; then
    source_icon="p ";
    remain_suffix="till full";
fi

remain_part="($remain $remain_suffix)"
if [ "$perc" == "100%" -a "$remain" == "0:00" ] ; then
    remain_part="(full)"
fi

if [ $DEBUG ] ; then
    echo "pmset line=`pmset -g batt | grep %`"
    echo "perc=$perc"
    echo "remain=$remain"
    echo "remain_suffix=$remain_suffix"
    echo "remain_part=$remain_part"
    echo "source=$source"
    echo "source_icon=$source_icon"
fi

# limit total length
if [ ${#perc} -gt 10 ] ; then
    perc='?%'
fi
if [ ${#remain} -gt 6 ] ; then
    remain='?'
fi

echo "$source_icon $perc $remain_part |"
