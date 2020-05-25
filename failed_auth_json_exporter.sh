mv failed_auth.json failed_auth.json.old

echo "[" > failed_auth.json && zcat -f –stdout /var/log/auth.log* | grep "Invalid user" | awk '{print " {\"month\": \"" $1 "\", \"day\":\"" $2 "\", \"hour\": \"" $3 "\", \"user\": \"" $8 "\", \"ip\": \"" $10 "\"},"}' | uniq | sed '$ s/,$//' | tee -a failed_auth.json && echo "]" >> failed_auth.json

chmod 755 failed_auth.json

