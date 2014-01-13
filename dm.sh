#!/bin/bash

dmepath=""
retval=1

for var
do
	if [[ $var != -* && $var == *.dme ]]
	then
		dmepath=`echo $var | sed -r 's/.{4}$//'`
		break
	fi
done

if [[ $dmepath == "" ]]
then
	echo "No .dme file specified, aborting."
	exit 1
fi

if [[ -a $dmepath.mdme ]]
then
	rm $dmepath.mdme
fi

cp $dmepath.dme $dmepath.mdme
if [[ $? != 0 ]]
then
	echo "Failed to make modified dme, aborting."
	exit 2
fi

for var
do
	arg=`echo $var | sed -r 's/^.{2}//'`
	if [[ $var == -D* ]]
	then
		sed -i '1s/^/#define '$arg'\n/' $dmepath.mdme
		continue
	fi
	if [[ $var == -M* ]]
	then
		sed -i 's!// BEGIN_INCLUDE!// BEGIN_INCLUDE\n#include "_maps\\'$arg'.dm"!' $dmepath.mdme
		continue
	fi
done

if [[ `uname` == MINGW* ]]
then
	dm.exe $dmepath.mdme
	retval=$?
else
	DreamMaker $dmepath.mdme
	retval=$?
fi

mv $dmepath.mdme.dmb $dmepath.dmb
mv $dmepath.mdme.rsc $dmepath.rsc

rm $dmepath.mdme

exit $retval
