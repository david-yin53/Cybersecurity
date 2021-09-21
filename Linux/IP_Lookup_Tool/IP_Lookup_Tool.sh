#!/bin/bash/

#will take an ip input on script execution. run the following command in the IP_Lookup_Tool directory: sh IP_Lookup_Tool.sh [insert IP here]
curl -s http://ipinfo.io/$1 > ip_temp.txt

#takes information about IP address including city, country, and org and creates a txt file
grep '"ip":' ip_temp.txt > output_ip.txt
grep '"city":' ip_temp.txt >> output_ip.txt
grep '"country":' ip_temp.txt >> output_ip.txt
grep '"org":' ip_temp.txt >> output_ip.txt

#displays txt file for selected info
cat output_ip.txt
