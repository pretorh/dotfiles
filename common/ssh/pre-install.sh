#!/usr/bin/env bash
dest=$1

mkdir -pv "$dest/.ssh/"{config.d,keys,known_hosts.d}
