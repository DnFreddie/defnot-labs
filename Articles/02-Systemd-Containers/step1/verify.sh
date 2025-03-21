systemctl --user is-active quadlet
response=$(curl -s -w "%{http_code}" -o /tmp/curl_output localhost:3000)
[[ $response == "200" && -s /tmp/curl_output ]]; 

