#!/bin/bash

set -Eeuo pipefail

if ! [ -d $1 ]
        then
                echo "No such directory"
                exit 2
fi

directory=$1
user=''
cur_dir=''

cd $directory
for f in *
do
	cur_user=$(stat -c '%U' $f)
	if [ "$user" != "$cur_user" ]
		then
			user=$cur_user
			cur_dir=$user
			mkdir -p $cur_dir
	fi
	if [ "$f" != "$cur_dir" ]
		then
			mv $f "$cur_dir/$f"
			echo "$cur_dir/$f"
	fi
done

echo "Succesfully sorted."
