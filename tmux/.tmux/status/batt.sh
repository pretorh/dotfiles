perc=`pmset -g batt | grep % | perl -pe "s/^.+-0\s+(\d+%).+$/\1/"`
remain=`pmset -g batt | grep % | perl -pe "s/^.*(\d:\d\d) remaining$/\1/"`
echo "Batt: $perc ($remain) |"
