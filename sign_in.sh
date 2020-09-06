#!/bin/sh

convert_utf8()
{
	echo "$1"	\
	|	sed 's/%/%25/g'		|	sed 's/\&/%26/g'	|	sed 's/!/%21/g'	\
	|	sed 's/"/%22/g'		|	sed 's/#/%23/g'		|	sed 's/\$/%24/g'	|	sed 's/(/%28/g'		\
	|	sed 's/)/%29/g'		|	sed 's/+/%2B/g'		|	sed 's/,/%2C/g'		| 	sed 's/\//%2F/g'	\
	|	sed 's/:/%3A/g'		|	sed 's/;/%3B/g'		|	sed 's/</%3C/g'		| 	sed 's/=/%3D/g'		\
	|	sed 's/>/%3E/g'		|	sed 's/?/%3F/g'		|	sed 's/@/%40/g'		| 	sed 's/\[/%5B/g'	\
	|	sed 's/]/%5D/g'		|	sed 's/\^/%5E/g'	|	sed 's/`/%60/g' 	|	sed 's/{/%7B/g'		\
	|	sed 's/|/%7C/g'		|	sed 's/}/%7D/g'
}


printf "Login: "
read LOGIN

stty -echo
printf "Password: "
read PASSWORD
stty echo
printf "\n"

echo -n "" > cookies.txt

TOKEN=$(curl -s -c cookies.txt -b cookies.txt 'https://signin.intra.42.fr/users/sign_in' --compressed)
TOKEN=$(echo -n "$TOKEN"	| sed '/<meta name="csrf-token" content="/!d;s//&\n/;s/.*\n//;:a;/"/bb;$!{n;ba};:b;s//\n&/;P;D')
TOKEN=$(convert_utf8 "$TOKEN")

PASSWORD=$(convert_utf8 "$PASSWORD")

curl -s -c cookies.txt -b cookies.txt 'https://signin.intra.42.fr/users/sign_in' \
--data-raw "utf8=%E2%9C%93&authenticity_token=$TOKEN&user%5Blogin%5D=$LOGIN&user%5Bpassword%5D=$PASSWORD&commit=Sign+in" \
--compressed > /dev/null

CHECK="$(curl -s -b cookies.txt https://profile.intra.42.fr/)"
CHECK=$(echo -n "$CHECK" | grep "Intra Profile Home")

if [ -z  "$CHECK" ];
	then printf "\e[31mLOGIN : [FAILED]"
	else printf "\e[32mLOGIN : [SUCCESS]"
fi

printf "\e[0m\n"
exit

curl 'https://signin.intra.42.fr/users/sign_in' \
  -H 'Connection: keep-alive' \
  -H 'Cache-Control: max-age=0' \
  -H 'Origin: https://signin.intra.42.fr' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'DNT: 1' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Referer: https://signin.intra.42.fr/users/sign_in' \
  -H 'Accept-Language: fr' \
  -H 'Cookie: pro.id=bnVsbA%3D%3D--af7657a8234901541e1115b23c7a73d93a7191fd; user.id=bnVsbA%3D%3D--af7657a8234901541e1115b23c7a73d93a7191fd; _intra_42_session_production=539a4fb63b2bb497cf8f714dd05d0616' \
  --data-raw 'utf8=%E2%9C%93&authenticity_token=pYm%2B%2F0XwpoB5CYYuTwaSCdPgx4DDs%2FlhrLVc%2Fq99Floyzc1bXsZz5%2BnG8WVvbD48UIWNKcbbkFaFxHPWsU2Rfg%3D%3D&user%5Blogin%5D=smaccary&user%5Bpassword%5D=motdepasse%40&commit=Sign+in' \
  --compressed

pYm+/0XwpoB5CYYuTwaSCdPgx4DDs/lhrLVc/q99Floyzc1bXsZz5+nG8WVvbD48UIWNKcbbkFaFxHPWsU2Rfg==
pYm%2B%2F0XwpoB5CYYuTwaSCdPgx4DDs%2FlhrLVc%2Fq99Floyzc1bXsZz5%2BnG8WVvbD48UIWNKcbbkFaFxHPWsU2Rfg%3D%3D