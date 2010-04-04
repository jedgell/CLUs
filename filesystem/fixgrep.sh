#!/bin/bash

finda=
findd=.

while getopts 'd:t:a:p:' OPTS

	do
		case $OPTS in
			d)	findd="$OPTARG" ;;
			t)	findt="$OPTARG" ;;
			a)	finda="$OPTARG" ;;
			p)	grepp="$OPTARG" ;;
			?)	echo 'Usage fixgrep.sh [-d base directory] [-t filetype] [-a other find args, eg --prune] [-p phrase]' 
				exit 2 ;;
		esac
	done
shift $(($OPTIND + 1))

if [ ! $findt ]; then echo "Must include file type [-t]"; exit 2; fi
if [ ! $grepp ]; then echo "Must include search string [-p]"; exit 2; fi

if [ $finda ]; then
	find "$findd" -type "$findt" "$finda"  | xargs grep "$grepp"
else
	find "$findd" -type "$findt" | xargs grep "$grepp"
fi
