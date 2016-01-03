#! /bin/bash

if [[ $1 != *.odt ]]; then
	exit 0;
fi

echo "Converting " $1

cd $TARGET_FOLDER
/usr/bin/libreoffice --headless --convert-to pdf "$1"
