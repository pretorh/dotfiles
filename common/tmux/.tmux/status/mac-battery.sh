perc=`pmset -g batt | grep % | perl -pe "s/^.+-0\s+(\d+%).+$/\1/"`
remain=`pmset -g batt | grep % | perl -pe "s/^.*(\(no estimate\)).*$/\1/"`
if [ -z "$remain" ] ; then
    remain=`pmset -g batt | grep % | perl -pe "s/^.*(\d:\d\d) remaining.*$/\1/"`
fi

from=`pmset -g batt | grep "drawing from" | perl -pe "s/^.*from '(.+) Power'$/\1/"`
if [ "$from" == "Battery" ] ; then
    from="🔋 ";
elif [ "$from" == "AC" ] ; then
    from="⚡ ";
fi

echo "$from $perc $remain |"
