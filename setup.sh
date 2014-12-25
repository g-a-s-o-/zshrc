#!/bin/sh

CWD=`dirname $0`
echo ${CWD}
SCRIPT_DIR=`cd ${CWD} && pwd`
echo ${SCRIPT_DIR}

if [ -e ~/.zsh ]
then
	echo "~/.zsh/ is exist."
else
	echo "Create ~/.zsh/ "
	mkdir ~/.zsh
fi

echo "Creating ~/.zshrc"
cp ${SCRIPT_DIR}/zshrc ~/.zshrc

echo "Creating ~/.zsh/alias"
cp ${SCRIPT_DIR}/alias ~/.zsh/alias
