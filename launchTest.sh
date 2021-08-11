#!/bin/bash

###Get CampaignName and Cerberus Host
echo "Author: $AUTHOR";
echo "Cerberus Host: $HOST";
echo "Campaign Name: $CAMPAIGN";

###Generate Tag using Campaign Name, Commiter and UnixTimestamp
tag=$CAMPAIGN.$AUTHOR.$(date +%s)

###Run Campaign
curl --request POST --url "$HOST/AddToExecutionQueueV003" -d campaign=$CAMPAIGN -d tag=$tag -H "apikey : $APIKEY"

###Loop on resultCI Until end of campaign
num=0
while [ $num -lt 3 ]
do
    result=$(curl --request POST --url "$HOST/ResultCIV004" -d tag=$tag -H "apikey : $APIKEY"| jq -r '.result')
    echo $result
    if [[ "$result" != "PE" ]]; then
        break
    fi
    sleep 3
    echo "One more try"
done

if [[ "$result" != "OK" ]]; then
    exit 1
fi
echo $result
