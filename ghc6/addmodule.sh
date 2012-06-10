#!/bin/bash

test $# -ne 1 && { echo "usage: $0 Modulename, exiting"; exit 1;}

MODULENAME=$1
MODULEFILE="${MODULENAME}.hs"

test -e $MODULEFILE && { echo "${MODULEFILE} already exists, exiting"; exit 1;}
grep -q "\<${MODULENAME}\>" modules.lst && { echo "${MODULENAME} already exists in modules.lst, exiting"; exit 1;}

cat Skeleton.hs | sed "s/\<Skeleton\>/${MODULENAME}/g" >${MODULEFILE}
echo ${MODULENAME} >>modules.lst

echo "now import the new Test in Main.hs"
echo "and do svn add ${MODULEFILE}"

