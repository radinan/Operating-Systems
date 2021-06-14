#!/bin/bash

if [[ $1 =~ ^[1-9a-zA-Z]+$ ]]; then
	echo yes;
else
	echo no;
fi
