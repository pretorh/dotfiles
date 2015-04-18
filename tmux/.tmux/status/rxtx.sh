iface=en0

# first
rx0=`ifconfig $iface | grep "RX packets" | perl -pe "s/.*bytes (\d*).*/\1/"`
tx0=`ifconfig $iface | grep "TX packets" | perl -pe "s/.*bytes (\d*).*/\1/"`

# wait, read again
sleep 1
rx1=`ifconfig $iface | grep "RX packets" | perl -pe "s/.*bytes (\d*).*/\1/"`
tx1=`ifconfig $iface | grep "TX packets" | perl -pe "s/.*bytes (\d*).*/\1/"`

# calc
rxs=$(((rx1-rx0) / 1024))
txs=$(((tx1-tx0) / 1024))

printf "RX/TX %03d/%03d" $rxs $txs
