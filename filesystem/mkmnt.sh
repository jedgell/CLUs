#!/bin/bash

if [ -d /mnt/$1 ]; then
	ehco 'Directory exists'
else
	mkdir -pv /mnt/$1
fi
mount /dev/$1 /mnt/$1

