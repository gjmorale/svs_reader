#!/bin/sh
echo "Please enter username"
read USER
JA="jahonorato"
GM="gmorales"

echo %~f0
if [ "$USER" == "$GM" ]; then
	INPUT_SVS="/home/finantecdeveloper/Dropbox (Finantec)/Quaam - Operaciones/Macros/SVS/data"
	export INPUT_SVS
	OUTPUT_SVS="/home/finantecdeveloper/Dropbox (Finantec)/Quaam - Operaciones/Macros/SVS/data"
	export OUTPUT_SVS
	echo "Welcome Guillermo"
fi

if [ "$USER" == "$JA" ]; then
	INPUT_SVS="data2"
	export INPUT_SVS
	OUTPUT_SVS="data2"
	export OUTPUT_SVS
	echo "Welcome José Antonio"
fi

ruby preciosSVS.rb