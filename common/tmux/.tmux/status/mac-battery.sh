perc=`pmset -g batt | grep % | perl -pe "s/^.+-0\s+(\d+%).+$/\1/"`
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

echo "$source_icon $perc ($remain) |"
