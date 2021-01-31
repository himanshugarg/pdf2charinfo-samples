#!/bin/bash

OIFS="$IFS"
IFS=' '

for linksfile in pdflinks*.txt
do
    while read line
    do
	read -a params <<< "${line}"
	source=${params[1]}
	dest=${params[2]}${params[0]}.pdf
	destcopy=$dest.copy
	if [ ! -f $dest ]; then
		wget $source -O $destcopy
		mv $destcopy $dest
		sleep 2
	fi
    done <${linksfile}
done

IFS="$OIFS"
