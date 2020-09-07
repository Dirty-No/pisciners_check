#!/bin/sh
CAMPUS=$(curl -s -b cookies.txt "https://profile.intra.42.fr/users/$1/coalitions?cursus=42cursus" | grep campus_id)
if [ -z "$CAMPUS" ];
then
	printf "%-10s :	[FAIL]\n" "$1" >&2
else
	printf "%-10s :	[SUCCESS]\n" "$1"
fi 