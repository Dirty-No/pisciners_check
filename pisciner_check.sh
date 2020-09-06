#!/bin/sh
CAMPUS=$(curl -s -b cookies.txt "https://profile.intra.42.fr/users/$1/coalitions?cursus=42cursus" | grep campus_id)
if [ -z "$CAMPUS" ];
then
	echo "$1 : [FAIL]" >&2
else
	echo "$1 : [SUCCESS]"
fi