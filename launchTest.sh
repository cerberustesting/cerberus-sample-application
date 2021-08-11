#!/bin/bash

###Get CampaignName and Cerberus Host
while getopts c:h:n: flag
do
    case "${flag}" in
        c) committer=${OPTARG};;
        h) host=${OPTARG};;
        n) campaignName=${OPTARG};;
    esac
done
echo "Committer: $committer";
echo "Cerberus Host: $host";
echo "Campaign Name: $campaignName";

###Generate Tag using Campaign Name, Commiter and UnixTimestamp
tag=$campaignName.$(date +%s)

###Run Campaign
curl --request POST --url "$host/AddToExecutionQueueV003" -d campaign=$campaignName -d tag=$tag

###Loop on resultCI Until end of campaign
num=0
while [ $num -lt 3 ]
do
    result=$(curl --request POST --url "$host/ResultCIV004" -d tag=$tag | jq -r '.result')
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
