#!/bin/sh
export OSLAB_PATH=$(dirname `which $0`)

if [ ! -e "$OSLAB_PATH/hdc/umounted" ]; then
	echo umount hdc first
	sudo umount $OSLAB_PATH/hdc
	if [ "$?" != "0" ]; then
		exit
	fi
fi

$OSLAB_PATH/bochs/bochs-gdb -q -f $OSLAB_PATH/bochs/bochsrc.bxrc
