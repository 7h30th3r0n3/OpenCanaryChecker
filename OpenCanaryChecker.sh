#!/bin/bash
# OpenCanaryChecker is a script to parse usefull information of opencanary log, very usefull to get realtime informations with watch 
# watch ./OpenCanaryChecker.sh
# this script use geoiplookup and jq, please install it before any use
# Made with love for fun by 7h30th3r0n3
#

log_content=$(cat /var/tmp/opencanary.log)

username_count=$(echo "$log_content" | jq -r 'select(.logdata.USERNAME!=null) | .logdata.USERNAME' | sort -u | wc -l)
password_count=$(echo "$log_content" | jq -r 'select(.logdata.PASSWORD!=null) | .logdata.PASSWORD' | sort -u | wc -l)

echo "Unique Usernames: $username_count"
echo "Unique Passwords: $password_count"
echo ""

echo "Visited ports and how many times:"
echo "$log_content" | jq -r 'select(.dst_port!=null) | .dst_port' | sort | uniq -c | awk '{print "Port", $2, ":", $1}'

total=$(echo "$log_content" | jq -r 'select(.dst_port!=null) | .dst_port' | wc -l)
echo "Total: $total"

echo ""
unique_ips=$(echo "$log_content" | jq -r 'select(.logdata.USERNAME!=null or .logdata.PASSWORD!=null) | .src_host' | sort -u)
count=$(echo "$unique_ips" | wc -l)

echo "$count IP Addresses:"
echo "$unique_ips" | awk '{ORS = (NR % 6 == 0) ? "\n" : ", "} 1'
echo ""
echo ""

echo "Top 10 most used username and password pairs:"
echo "$log_content" | jq -r 'select(.logdata.USERNAME != null and .logdata.PASSWORD != null) | "\(.logdata.USERNAME):\(.logdata.PASSWORD)"' | sort | uniq -c | sort -rn | head -10 | awk '{gsub(/"/, "", $2); printf "%s = %s\n", $2, $1}'
echo ""

echo "Last 10 login attempts:"
echo "$log_content" | jq -r 'select(.logdata.USERNAME != null and .logdata.PASSWORD != null) | "On Port:\(.dst_port) with Ip:\(.src_host) = \(.logdata.USERNAME):\(.logdata.PASSWORD)"' | tail -10 | tac
echo ""

echo "Source Countries:"
ips=$(cat /var/tmp/opencanary.log | jq -r 'select(.logdata.USERNAME!=null or .logdata.PASSWORD!=null) | .src_host' | sort -u)
declare -A countries_count
sorted_countries=""

for ip in $ips; do
    country=$(geoiplookup $ip | awk -F': ' '{print $2}' | awk -F',' '{print $1}' | sed 's/GeoIP Country Edition: //g')
    ((countries_count["$country"]++))
done

for country in "${!countries_count[@]}"; do
    sorted_countries+="$country : ${countries_count["$country"]}"$'\n'
done

echo -e "$sorted_countries" | sort -k3,3rn -k1,1
