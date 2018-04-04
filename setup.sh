#!/bin/bash

function init {
    git submodule init
    git submodule update
    pushd bundle
    for i in * ; do
        pushd $i
        git submodule init
        git submodule update
        popd
    done
    popd

}

function update {
    git pull
    pushd bundle
    git submodule init
    git submodule foreach git pull origin master
    for i in * ; do
        pushd $i
        git submodule init
	    git submodule foreach git pull origin master
        popd
    done
    popd
}

if [ "$1" = "init" ] ; then
	init
elif [ "$1" = "update" ] ; then
	update
elif [ $1 -z ] ; then
	echo "Please choose either \"$0 update\" or \"$0 init\""
	exit 1
fi
