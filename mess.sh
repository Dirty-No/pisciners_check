#!/bin/sh

curl 'https://discord.com/api/v8/channels/725700959417794570/messages?limit=100' \
  -H 'authority: discord.com' \
  -H 'x-super-properties: eyJvcyI6IldpbmRvd3MiLCJicm93c2VyIjoiQ2hyb21lIiwiZGV2aWNlIjoiIiwiYnJvd3Nlcl91c2VyX2FnZW50IjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzg1LjAuNDE4My44MyBTYWZhcmkvNTM3LjM2IiwiYnJvd3Nlcl92ZXJzaW9uIjoiODUuMC40MTgzLjgzIiwib3NfdmVyc2lvbiI6IjEwIiwicmVmZXJyZXIiOiIiLCJyZWZlcnJpbmdfZG9tYWluIjoiIiwicmVmZXJyZXJfY3VycmVudCI6IiIsInJlZmVycmluZ19kb21haW5fY3VycmVudCI6IiIsInJlbGVhc2VfY2hhbm5lbCI6InN0YWJsZSIsImNsaWVudF9idWlsZF9udW1iZXIiOjY2NjE4LCJjbGllbnRfZXZlbnRfc291cmNlIjpudWxsfQ==' \
  -H 'dnt: 1' \
  -H 'authorization: NTI1NzYzNzUxOTMzMzc4NTkz.XySgOg.T50qrWemTnjBKt7dG2jTmnyN1YA' \
  -H 'accept-language: fr' \
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36' \
  -H 'accept: */*' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://discord.com/channels/725700475566948352/725700959417794570' \
  -H 'cookie: __cfduid=dbf2b29e23ab74affb2855d7537004e301598545702; locale=fr' \
  --compressed | sed '/"content": "/!d;s//&\n/;s/.*\n//;:a;/"/bb;$!{n;ba};:b;s//\n&/;P;D' | grep "!register"

