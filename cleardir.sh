#!/bin/bash

set -Eeuo pipefail

if ! [ -d $1 ]
        then
                echo "No such directory"
                exit 2
fi

directory=$1

del_list=$(find $directory -type f -iregex '.*\.\(bak\|tmp\|backup\)$')
del_count=$(echo "$del_list" | wc -l)

for f in $del_list
do
	rm $f
done

echo "$del_count temporary files deleted."
