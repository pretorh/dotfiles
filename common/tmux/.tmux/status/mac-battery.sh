# get percent line. split by ;, then by spaces
perc=`pmset -g batt | grep % | awk -F ';' '{print $1}' | awk -F ' ' '{print $3}'`

# get the remaining estimated time
remain=`pmset -g batt | grep % | perl -pe "s/^.*\((no estimate)\).*$/\1/"`
if [ "$remain" != "no estimate" ] ; then
    remain=`pmset -g batt | grep % | perl -pe "s/^.*(\d:\d\d) remaining.*$/\1/"`
fi

source=`pmset -g batt | grep "drawing from" | perl -pe "s/^.*from '(.+) Power'$/\1/"`
if [ "$source" == "Battery" ] ; then
    source_icon="🔋 ";
    remain="$remain remain";
elif [ "$source" == "AC" ] ; then
    source_icon="⚡ ";
    remain="$remain till full";
fi

if [ $DEBUG ] ; then
    echo "perc=$perc"
    echo "remain=$remain"
    echo "source=$source"
    echo "source_icon=$source_icon"
fi

# limit total length
if [ ${#perc} -gt 10 ] ; then
    perc='?%'
fi
if [ ${#remain} -gt 12 ] ; then
    remain='? remain'
fi

echo "$source_icon $perc ($remain) |"
