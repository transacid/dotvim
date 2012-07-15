#!/bin/bash

function init {
	ln -s ~/.vim/vimrc ~/.vimrc
	git submodule init
	git submodule update
}

function update {
	git submodule foreach git pull origin master
}

if [ "$1" = "init" ] ; then
	init
elif [ "$1" = "update" ] ; then
	update
elif [ $1 -z ] ; then
	echo "Please choose either \"$0 update\" or \"$0 init\""
	exit 1
fi
