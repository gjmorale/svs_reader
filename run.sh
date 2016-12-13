#!/bin/sh
echo "Please enter username"
read USER
JA="jahonorato"
GM="gmorales"

if [ "$USER" == "$GM" ]; then
	INPUT_SVS="data"
	export INPUT_SVS
	OUTPUT_SVS="data2"
	export OUTPUT_SVS
	echo "Welcome Guillermo"
fi

if [ "$USER" == "$JA" ]; then
	INPUT_SVS="/Users/joseantoniohonorato/Desktop/Import/SVS"
	export INPUT_SVS
	OUTPUT_SVS="/Users/joseantoniohonorato/Desktop/Import/SVS"
	export OUTPUT_SVS
	echo "Welcome José Antonio"
fi

ruby preciosSVS.rb