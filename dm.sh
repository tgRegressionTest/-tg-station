#!/bin/bash

dmepath=""

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
	if [[ $var == -D* ]]
	then
		define=`echo $var | sed -r 's/^.{2}//'`
		sed -i '1s/^/#define '$define'\n/' $dmepath.mdme
	fi
done

if [[ `uname` == MINGW* ]]
then
	dm.exe $dmepath.mdme
else
	DreamMaker $dmepath.mdme
fi
mv $dmepath.mdme.dmb $dmepath.dmb
mv $dmepath.mdme.rsc $dmepath.rsc

rm $dmepath.mdme
